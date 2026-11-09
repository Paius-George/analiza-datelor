import { spawnSync } from "node:child_process";
import { appendFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import { createCloudflareApi, ensureWorkersSubdomain } from "./cloudflare-api.mjs";

const domain = process.env.ACCESS_TEAM_DOMAIN?.trim() ?? "";
const audience = process.env.ACCESS_AUD?.trim() ?? "";

if (domain || audience) {
  if (!/^[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.cloudflareaccess\.com$/.test(domain) ||
      !/^[a-f0-9]{64}$/.test(audience)) {
    throw new Error("Configurează împreună ACCESS_TEAM_DOMAIN (fără https://) și ACCESS_AUD (64 caractere hexazecimale).");
  }
}

const message = domain
  ? "Publicare cu verificarea tokenurilor Cloudflare Access. Lista adreselor aprobate se gestionează în Cloudflare."
  : "Publicare blocată: aplicația răspunde cu 503 până configurezi Cloudflare Access și cele două variabile GitHub. Materialele nu sunt servite.";
console.log(message);
if (process.env.GITHUB_STEP_SUMMARY) {
  appendFileSync(process.env.GITHUB_STEP_SUMMARY, `### Starea accesului\n\n${message}\n`);
}

const cli = fileURLToPath(new URL("../node_modules/wrangler/bin/wrangler.js", import.meta.url));
if (process.env.CLOUDFLARE_API_TOKEN && process.env.CLOUDFLARE_ACCOUNT_ID) {
  const api = createCloudflareApi(process.env.CLOUDFLARE_ACCOUNT_ID.trim(), process.env.CLOUDFLARE_API_TOKEN.trim());
  const subdomain = await ensureWorkersSubdomain(api);
  console.log(`Adresa aplicației: https://analiza-datelor.${subdomain}.workers.dev`);
}
const result = spawnSync(process.execPath, [
  cli, "deploy",
  "--var", `ACCESS_TEAM_DOMAIN:${domain}`,
  "--var", `ACCESS_AUD:${audience}`,
], { stdio: "inherit" });
if (result.error) throw result.error;
process.exit(result.status ?? 1);
