import { appendFileSync } from "node:fs";
import { createCloudflareApi } from "./cloudflare-api.mjs";
import { configureAccess, parseApprovedEmails } from "./access-setup.mjs";

const api = createCloudflareApi(process.env.CLOUDFLARE_ACCOUNT_ID?.trim(), process.env.CLOUDFLARE_API_TOKEN?.trim());
const result = await configureAccess(api, parseApprovedEmails(process.env.APPROVED_EMAILS));

// These are public configuration values, not API credentials or login tokens.
console.log(`ACCESS_TEAM_DOMAIN=${result.domain}`);
console.log(`ACCESS_AUD=${result.audience}`);
console.log(`APP_URL=${result.url}`);
console.log(`Politica permite exact ${result.emails.length} adrese aprobate.`);
if (process.env.GITHUB_OUTPUT) {
  appendFileSync(process.env.GITHUB_OUTPUT, `domain=${result.domain}\naudience=${result.audience}\nurl=${result.url}\n`);
}
if (process.env.GITHUB_STEP_SUMMARY) {
  appendFileSync(process.env.GITHUB_STEP_SUMMARY,
    `### Autentificare configurată\n\nAplicație: ${result.url}\n\nAdrese aprobate: ${result.emails.map(email => `\`${email}\``).join(", ")}.\n\nAutentificare prin One-time PIN; sesiune de 8 ore.\n`);
}
