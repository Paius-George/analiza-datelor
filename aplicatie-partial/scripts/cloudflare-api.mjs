export class CloudflareError extends Error {
  constructor(status, errors, accountId, token) {
    const codes = errors.map(error => error.code).join(", ");
    const details = errors.map(error => error.message).join("; ")
      .replaceAll(accountId, "[account]").replaceAll(token, "[token]");
    super(`Cloudflare HTTP ${status} (${codes}): ${details}`);
    this.status = status;
    this.codes = errors.map(error => error.code);
  }
}

export function createCloudflareApi(accountId, token, transport = fetch) {
  if (!/^[a-f0-9]{32}$/i.test(accountId ?? "") || !token?.trim()) {
    throw new Error("Lipsesc sau sunt invalide secretele CLOUDFLARE_ACCOUNT_ID / CLOUDFLARE_API_TOKEN.");
  }
  return async function api(path, { method = "GET", body } = {}) {
    const response = await transport(`https://api.cloudflare.com/client/v4/accounts/${accountId}${path}`, {
      method,
      headers: { Authorization: `Bearer ${token}`, ...(body ? { "Content-Type": "application/json" } : {}) },
      ...(body ? { body: JSON.stringify(body) } : {}),
      signal: AbortSignal.timeout(30_000),
    });
    const data = await response.json();
    if (!response.ok || !data.success) {
      throw new CloudflareError(response.status, data.errors ?? [], accountId, token);
    }
    return data.result;
  };
}

export async function ensureWorkersSubdomain(api) {
  try {
    const existing = await api("/workers/subdomain");
    if (existing?.subdomain) return existing.subdomain;
    throw new Error("Cloudflare a returnat un subdomeniu gol; configurația contului nu a fost modificată.");
  } catch (error) {
    // This is the documented Wrangler error for a new account with no subdomain.
    // Authentication failures and other errors must never trigger account changes.
    if (!error.codes?.includes(10007)) throw error;
  }
  for (const subdomain of ["paius-george", "paius-george-facultate"]) {
    try {
      const created = await api("/workers/subdomain", { method: "PUT", body: { subdomain } });
      if (!created?.subdomain) throw new Error("Cloudflare nu a confirmat subdomeniul creat.");
      return created.subdomain;
    } catch (error) {
      if (!error.codes?.includes(10031)) throw error;
    }
  }
  throw new Error("Numele workers.dev propuse sunt ocupate; configurează un nume în Workers & Pages.");
}
