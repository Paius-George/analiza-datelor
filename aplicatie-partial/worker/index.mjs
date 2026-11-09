import { createRemoteJWKSet, jwtVerify } from "jose";

const privacyHeaders = {
  "Cache-Control": "private, no-store",
  "X-Robots-Tag": "noindex, nofollow, noarchive",
  "X-Content-Type-Options": "nosniff",
  "X-Frame-Options": "DENY",
  "Referrer-Policy": "no-referrer",
};

function denied(status, message) {
  return new Response(message, {
    status,
    headers: { ...privacyHeaders, "Content-Type": "text/plain; charset=utf-8" },
  });
}

// An injectable JWKS transport lets tests exercise real signatures without
// contacting Cloudflare. Production always uses jose's HTTPS JWKS resolver.
export function createProtectedWorker(resolveKeys = createRemoteJWKSet) {
  const keySets = new Map();

  return {
    async fetch(request, env) {
      const domain = env.ACCESS_TEAM_DOMAIN;
      const audience = env.ACCESS_AUD;
      if (
        typeof domain !== "string" ||
        !/^[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.cloudflareaccess\.com$/.test(domain) ||
        typeof audience !== "string" ||
        !/^[a-f0-9]{64}$/.test(audience)
      ) {
        return denied(503, "Accesul este în curs de configurare. Revino mai târziu.");
      }

      const token = request.headers.get("Cf-Access-Jwt-Assertion");
      if (!token) {
        return denied(403, "Acces restricționat. Solicită aprobarea proprietarului.");
      }

      try {
        const issuer = `https://${domain}`;
        if (!keySets.has(domain)) {
          keySets.set(domain, resolveKeys(new URL(`${issuer}/cdn-cgi/access/certs`)));
        }
        const { payload } = await jwtVerify(token, keySets.get(domain), {
          issuer,
          audience,
          algorithms: ["RS256"],
          requiredClaims: ["exp", "iat", "sub", "email"],
        });
        if (payload.type !== "app" || typeof payload.email !== "string" || !payload.email) {
          return denied(403, "Autentificare invalidă. Conectează-te din nou.");
        }
      } catch {
        return denied(403, "Autentificare invalidă sau expirată. Conectează-te din nou.");
      }

      // All files, including JS bundles, images and downloadable lessons, pass
      // through verification before the ASSETS binding is ever invoked.
      const asset = await env.ASSETS.fetch(request);
      const response = new Response(asset.body, {
        status: asset.status,
        statusText: asset.statusText,
        headers: asset.headers,
      });
      for (const [name, value] of Object.entries(privacyHeaders)) {
        response.headers.set(name, value);
      }
      return response;
    },
  };
}

export default createProtectedWorker();
