import test from "node:test";
import assert from "node:assert/strict";
import { CloudflareError, createCloudflareApi, ensureWorkersSubdomain } from "../scripts/cloudflare-api.mjs";
import { configureAccess, parseApprovedEmails } from "../scripts/access-setup.mjs";

function apiError(status, code) {
  return new CloudflareError(status, [{ code, message: "test" }], "a".repeat(32), "test-token");
}

test("un subdomeniu existent este păstrat fără modificarea contului", async () => {
  const api = async (path, options) => {
    assert.equal(path, "/workers/subdomain");
    assert.equal(options, undefined);
    return { subdomain: "existing-name" };
  };
  assert.equal(await ensureWorkersSubdomain(api), "existing-name");
});

test("un cont nou primește un subdomeniu; un nume ocupat folosește alternativa", async () => {
  const attempts = [];
  const api = async (path, options = {}) => {
    assert.equal(path, "/workers/subdomain");
    if (!options.method) throw apiError(404, 10007);
    assert.equal(options.method, "PUT");
    attempts.push(options.body.subdomain);
    if (attempts.length === 1) throw apiError(409, 10031);
    return options.body;
  };
  assert.equal(await ensureWorkersSubdomain(api), "paius-george-facultate");
  assert.deepEqual(attempts, ["paius-george", "paius-george-facultate"]);
});

test("erorile de autentificare nu declanșează crearea sau schimbarea subdomeniului", async () => {
  let calls = 0;
  await assert.rejects(ensureWorkersSubdomain(async () => {
    calls++;
    throw apiError(403, 10000);
  }));
  assert.equal(calls, 1);
});

test("lista aprobată acceptă doar adrese explicite și elimină duplicatele", () => {
  assert.deepEqual(parseApprovedEmails("Owner@Example.com, coleg@example.com;owner@example.com"), ["owner@example.com", "coleg@example.com"]);
  for (const value of ["", "*", "*@example.com", "example.com", "user@", "a@b.com,Everyone"]) {
    assert.throws(() => parseApprovedEmails(value));
  }
});

function setupScenario({ newOrganization = false, unsafePolicy = false, existingApp = false, forbidden = false } = {}) {
  const writes = [];
  const emails = ["owner@example.com", "coleg@example.com"];
  let application;
  const api = async (path, options = {}) => {
    const method = options.method ?? "GET";
    if (method !== "GET") writes.push({ path, ...options });
    if (path === "/workers/subdomain") return { subdomain: "existing-name" };
    if (path === "/access/organizations") {
      if (forbidden) throw apiError(403, 10000);
      if (newOrganization && method === "GET") throw apiError(404, 1213);
      return { auth_domain: "owner.cloudflareaccess.com" };
    }
    if (path === "/access/identity_providers") {
      if (method === "POST") return { id: "otp-1", type: "onetimepin" };
      return newOrganization ? [] : [{ id: "otp-1", type: "onetimepin" }];
    }
    if (path.startsWith("/access/apps?")) {
      return existingApp ? [{ id: "app-1", domain: "analiza-datelor.existing-name.workers.dev" }] : [];
    }
    if (path === "/access/apps/app-1/policies") {
      return unsafePolicy ? [{ decision: "allow", include: [{ everyone: {} }] }] : application.policies;
    }
    if ((path === "/access/apps" && method === "POST") || (path === "/access/apps/app-1" && method === "PUT")) {
      application = options.body;
      return { id: "app-1", aud: "a".repeat(64) };
    }
    throw new Error(`Unexpected API request: ${method} ${path}`);
  };
  return { api, writes, emails, get application() { return application; } };
}

test("configurarea refolosește organizația și OTP, aprobând numai lista explicită", async () => {
  const scenario = setupScenario();
  const result = await configureAccess(scenario.api, scenario.emails);
  assert.equal(result.domain, "owner.cloudflareaccess.com");
  assert.equal(result.audience, "a".repeat(64));
  assert.equal(result.url, "https://analiza-datelor.existing-name.workers.dev");
  assert.equal(scenario.writes.length, 1);
  assert.equal(scenario.application.domain, new URL(result.url).hostname);
  assert.deepEqual(scenario.application.allowed_idps, ["otp-1"]);
  assert.equal(scenario.application.policies.length, 1);
  assert.deepEqual(scenario.application.policies[0].include, scenario.emails.map(email => ({ email: { email } })));
  assert.equal(scenario.application.session_duration, "8h");
});

test("un cont fără Zero Trust primește organizație și OTP, fără apeluri de abonare sau plată", async () => {
  const scenario = setupScenario({ newOrganization: true });
  await configureAccess(scenario.api, scenario.emails);
  assert.deepEqual(scenario.writes.map(write => write.path), ["/access/organizations", "/access/identity_providers", "/access/apps"]);
});

test("reluarea setupului actualizează aplicația existentă, fără duplicarea ei", async () => {
  const scenario = setupScenario({ existingApp: true });
  await configureAccess(scenario.api, scenario.emails);
  assert.equal(scenario.writes.length, 1);
  assert.equal(scenario.writes[0].method, "PUT");
  assert.equal(scenario.writes[0].path, "/access/apps/app-1");
});

test("o politică citită cu acces prea larg oprește publicarea autentificată", async () => {
  const scenario = setupScenario({ unsafePolicy: true });
  await assert.rejects(configureAccess(scenario.api, scenario.emails), /nu corespunde exact/);
});

test("lipsa permisiunilor Access nu este interpretată ca lipsa organizației", async () => {
  const scenario = setupScenario({ forbidden: true });
  await assert.rejects(configureAccess(scenario.api, scenario.emails));
  assert.deepEqual(scenario.writes, []);
});

test("clientul Cloudflare trimite credențialele exclusiv API-ului și le ascunde din erori", async () => {
  const account = "a".repeat(32), token = "secret-token";
  const api = createCloudflareApi(account, token, async (url, options) => {
    assert.equal(url, `https://api.cloudflare.com/client/v4/accounts/${account}/workers/subdomain`);
    assert.equal(options.headers.Authorization, `Bearer ${token}`);
    return Response.json({ success: false, errors: [{ code: 10000, message: `${account} ${token}` }] }, { status: 403 });
  });
  await assert.rejects(api("/workers/subdomain"), error => {
    assert.equal(error.status, 403);
    assert.ok(!error.message.includes(token));
    assert.ok(!error.message.includes(account));
    return true;
  });
});
