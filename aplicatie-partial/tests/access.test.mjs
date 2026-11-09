import test from "node:test";
import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { generateKeyPair, exportJWK, createLocalJWKSet, SignJWT } from "jose";
import { createProtectedWorker } from "../worker/index.mjs";

const domain = "analiza-test.cloudflareaccess.com";
const audience = "a".repeat(64);
const { privateKey, publicKey } = await generateKeyPair("RS256");
const jwk = await exportJWK(publicKey);
jwk.kid = "test-key";
const worker = createProtectedWorker(url => {
  assert.equal(url.href, `https://${domain}/cdn-cgi/access/certs`);
  return createLocalJWKSet({ keys: [jwk] });
});

async function sign(overrides = {}, key = privateKey) {
  const now = Math.floor(Date.now() / 1000);
  return new SignJWT({
    email: "coleg@example.com", type: "app", sub: "student-1",
    iss: `https://${domain}`, aud: [audience], iat: now, exp: now + 600,
    ...overrides,
  }).setProtectedHeader({ alg: "RS256", kid: "test-key" }).sign(key);
}

function assetsEnv() {
  const calls = [];
  return {
    calls,
    env: {
      ACCESS_TEAM_DOMAIN: domain, ACCESS_AUD: audience,
      ASSETS: { async fetch(request) {
        calls.push(new URL(request.url).pathname);
        return new Response("material privat", { headers: { "Cache-Control": "public, max-age=31536000" } });
      } },
    },
  };
}

function request(path = "/", token, headers = {}) {
  return new Request(`https://aplicatie.example${path}`, {
    headers: { ...headers, ...(token ? { "Cf-Access-Jwt-Assertion": token } : {}) },
  });
}

test("configurația lipsă sau invalidă blochează aplicația înainte de citirea fișierelor", async () => {
  for (const config of [
    { ACCESS_TEAM_DOMAIN: "", ACCESS_AUD: "" },
    { ACCESS_TEAM_DOMAIN: "https://" + domain },
    { ACCESS_TEAM_DOMAIN: "evil.example" },
    { ACCESS_TEAM_DOMAIN: domain + ".evil.example" },
    { ACCESS_AUD: "" },
  ]) {
    const { env, calls } = assetsEnv();
    const response = await worker.fetch(request(), { ...env, ...config });
    assert.equal(response.status, 503);
    assert.deepEqual(calls, []);
  }
});

test("linkurile directe către pagină, JS, imagini, fonturi și fișe necesită autentificare", async () => {
  for (const path of ["/", "/index.html", "/index.txt", "/_next/static/chunks/app.js", "/theory/images/01_histograme.png", "/fonts/noto-sans-regular.ttf", "/materiale/00_INCEPE_AICI.md", "/404.html"]) {
    const { env, calls } = assetsEnv();
    const response = await worker.fetch(request(path, undefined, {
      "Cf-Access-Authenticated-User-Email": "coleg@example.com",
      "oai-authenticated-user-email": "coleg@example.com",
    }), env);
    assert.equal(response.status, 403, path);
    assert.deepEqual(calls, []);
    assert.equal(response.headers.get("Cache-Control"), "private, no-store");
  }
});

test("tokenuri expirate, de la alt emitent/aplicație, fără email sau cu alt tip sunt refuzate", async () => {
  for (const overrides of [
    { exp: 1 }, { iss: "https://other.cloudflareaccess.com" },
    { aud: ["b".repeat(64)] }, { email: undefined }, { email: "" },
    { type: "org" }, { sub: undefined }, { exp: undefined },
    { nbf: Math.floor(Date.now() / 1000) + 3600 },
  ]) {
    const { env, calls } = assetsEnv();
    const response = await worker.fetch(request("/", await sign(overrides)), env);
    assert.equal(response.status, 403);
    assert.deepEqual(calls, []);
  }
});

test("o semnătură falsă sau un token malformat nu permite citirea materialelor", async () => {
  const other = await generateKeyPair("RS256");
  for (const token of ["not.a.token", await sign({}, other.privateKey)]) {
    const { env, calls } = assetsEnv();
    assert.equal((await worker.fetch(request("/", token), env)).status, 403);
    assert.deepEqual(calls, []);
  }
});

test("un token valid pentru aplicația corectă permite accesul fără cache public", async () => {
  const { env, calls } = assetsEnv();
  const path = "/materiale/00_INCEPE_AICI.md";
  const response = await worker.fetch(request(path, await sign()), env);
  assert.equal(response.status, 200);
  assert.equal(await response.text(), "material privat");
  assert.deepEqual(calls, [path]);
  assert.equal(response.headers.get("Cache-Control"), "private, no-store");
  assert.equal(response.headers.get("X-Robots-Tag"), "noindex, nofollow, noarchive");
});

test("indisponibilitatea cheilor Cloudflare refuză accesul", async () => {
  const unavailable = createProtectedWorker(() => async () => { throw new Error("offline"); });
  const { env, calls } = assetsEnv();
  assert.equal((await unavailable.fetch(request("/", await sign()), env)).status, 403);
  assert.deepEqual(calls, []);
});

test("configurația de publicare verifică fiecare fișier și nu expune URL-uri de preview", () => {
  const config = JSON.parse(readFileSync(new URL("../wrangler.json", import.meta.url)));
  assert.equal(config.assets.run_worker_first, true);
  assert.equal(config.preview_urls, false);
});
