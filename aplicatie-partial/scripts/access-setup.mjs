import { ensureWorkersSubdomain } from "./cloudflare-api.mjs";

export function parseApprovedEmails(value) {
  const emails = [...new Set((value ?? "").split(/[\s,;]+/).filter(Boolean).map(email => email.toLowerCase()))];
  if (!emails.length || emails.some(email => email.includes("*") || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email))) {
    throw new Error("Introdu lista completă de adrese aprobate, separate prin virgulă. Lista nu poate fi goală și nu acceptă wildcarduri.");
  }
  return emails;
}

export async function configureAccess(api, emails) {
  // Validate the list before making any account changes.
  emails = parseApprovedEmails(emails.join(","));
  const subdomain = await ensureWorkersSubdomain(api);
  const hostname = `analiza-datelor.${subdomain}.workers.dev`;
  let organization;
  try {
    organization = await api("/access/organizations");
  } catch (error) {
    if (error.status !== 404) throw error;
    organization = await api("/access/organizations", {
      method: "POST", body: { name: "Analiza Datelor", session_duration: "8h" },
    });
  }
  const domain = organization?.auth_domain;
  if (!/^[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.cloudflareaccess\.com$/.test(domain ?? "")) {
    throw new Error("Zero Trust nu are un domeniu valid. Finalizează configurarea Zero Trust în Cloudflare.");
  }

  const providers = await api("/access/identity_providers");
  let otp = providers.find(provider => provider.type === "onetimepin");
  if (!otp) {
    otp = await api("/access/identity_providers", {
      method: "POST", body: { name: "Cod pe e-mail", type: "onetimepin", config: {} },
    });
  }
  if (!otp?.id) throw new Error("Cloudflare nu a confirmat metoda One-time PIN.");

  // A domain filter avoids touching other Access applications in this account.
  const apps = await api(`/access/apps?domain=${encodeURIComponent(hostname)}&per_page=100`);
  const matching = apps.filter(app => app.domain === hostname);
  if (matching.length > 1) throw new Error("Mai multe aplicații Access protejează aceeași adresă; verifică-le în Cloudflare.");
  const existing = matching[0];
  const body = {
    name: "Analiza Datelor", type: "self_hosted", domain: hostname,
    session_duration: "8h", allowed_idps: [otp.id], auto_redirect_to_identity: true,
    app_launcher_visible: true,
    policies: [{
      name: "Colegi aprobați", decision: "allow", precedence: 1,
      include: emails.map(email => ({ email: { email } })), require: [], exclude: [],
    }],
  };
  const app = await api(existing ? `/access/apps/${existing.id}` : "/access/apps", {
    method: existing ? "PUT" : "POST", body,
  });
  if (!app?.id || !/^[a-f0-9]{64}$/.test(app.aud ?? "")) {
    throw new Error("Cloudflare nu a returnat o aplicație Access și un AUD valid.");
  }

  const policies = await api(`/access/apps/${app.id}/policies`);
  const policy = policies[0];
  const approved = policy?.include?.map(rule => rule.email?.email?.toLowerCase()).sort();
  if (policies.length !== 1 || policy.decision !== "allow" ||
      JSON.stringify(approved) !== JSON.stringify([...emails].sort()) ||
      (policy.exclude?.length ?? 0) !== 0 || (policy.require?.length ?? 0) !== 0) {
    throw new Error("Politica citită din Cloudflare nu corespunde exact adreselor aprobate; publicarea autentificată a fost oprită.");
  }
  return { domain, audience: app.aud, url: `https://${hostname}`, emails };
}
