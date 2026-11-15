export const CSE_STORAGE_KEY = 'cibernetica-sistemelor-economice-8020-v1';
export function parseDistribution(text) {
  const parts = String(text).trim().split(/[;\s]+/).filter(Boolean);
  if (parts.length < 2) throw new Error('Introdu cel puțin două clase, separate prin punct și virgulă sau spațiu.');
  const values = parts.map(value => {
    if (!/^\d+(?:[.,]\d+)?$/.test(value)) throw new Error('Folosește valori numerice nenegative; separă clasele cu ; și zecimalele cu virgulă sau punct.');
    return Number(value.replace(',', '.'));
  });
  if (values.some(v => !Number.isFinite(v) || v < 0) || !Number.isFinite(values.reduce((a,b)=>a+b,0)) || values.reduce((a,b)=>a+b,0) <= 0) throw new Error('Valorile trebuie să fie finite, nenegative și să aibă total pozitiv.');
  return values;
}
export function classifyIndicator(metric, value) {
  if (!Number.isFinite(value) || value < 0) throw new Error('Indicator invalid.');
  let color, label;
  if (metric === 'psi') { color = value < .1 ? 'green' : value <= .25 ? 'amber' : 'red'; label = color === 'green' ? 'Abateri mici; distribuție stabilă' : color === 'amber' ? 'Schimbare relevantă a distribuției' : 'Schimbare importantă a distribuției'; }
  else if (metric === 'hhi') { color = value < .1 ? 'green' : value <= .2 ? 'amber' : 'red'; label = color === 'green' ? 'Concentrare redusă' : color === 'amber' ? 'Concentrare moderată' : 'Concentrare ridicată'; }
  else if (metric === 'entropy') { color = value > .9 ? 'green' : value >= .6 ? 'amber' : 'red'; label = color === 'green' ? 'Diversificare ridicată' : color === 'amber' ? 'Diversificare moderată' : 'Diversificare redusă'; }
  else throw new Error('Indicator necunoscut.');
  return { color, label, name: color === 'green' ? 'Verde' : color === 'amber' ? 'Galben' : 'Roșu', action: color === 'green' ? 'Monitorizare obișnuită.' : color === 'amber' ? 'Investighează segmentele și cauzele.' : 'Analiză aprofundată și plan de acțiune.' };
}
export function analyzeDistributions(base, current) {
  if (!Array.isArray(base) || !Array.isArray(current) || base.length < 2 || base.length !== current.length) throw new Error('Cele două distribuții trebuie să aibă aceleași categorii, minimum două.');
  const normalized = [base,current].map(values => {
    if (values.some(v => !Number.isFinite(v) || v < 0)) throw new Error('Nu sunt admise valori negative sau infinite.');
    const total = values.reduce((a,b)=>a+b,0);
    if (!Number.isFinite(total) || total <= 0) throw new Error('Fiecare distribuție trebuie să aibă total pozitiv.');
    return values.map(v => v/total);
  });
  const [p,q] = normalized, n = p.length;
  const hhi = q.reduce((sum,z)=>sum+z*z,0);
  const hhiNormalized = Math.max(0,Math.min(1,(n*hhi-1)/(n-1)));
  const entropy = -q.reduce((sum,z)=>sum+(z === 0 ? 0 : z*Math.log(z)),0);
  const entropyNormalized = Math.max(0,Math.min(1,entropy/Math.log(n)));
  const hasZeros = p.some(v=>v===0) || q.some(v=>v===0);
  const contributions = p.map((v,i) => hasZeros ? null : (v-q[i])*Math.log(v/q[i]));
  const psi = hasZeros ? null : Math.max(0,contributions.reduce((sum,v)=>sum+(v??0),0));
  return { p,q,contributions,psi,hhi,hhiNormalized,entropy,entropyNormalized,
    psiNote: hasZeros ? 'PSI nu este calculat: există ponderi zero. Este necesară o convenție explicită de regularizare sau regrupare; datele nu au fost modificate.' : null };
}
export function expectedLoss(pdPercent, lgdPercent, ead) {
  if (![pdPercent,lgdPercent,ead].every(Number.isFinite) || pdPercent < 0 || pdPercent > 100 || lgdPercent < 0 || lgdPercent > 100 || ead < 0) throw new Error('PD și LGD trebuie să fie între 0 și 100%, iar EAD nenegativ.');
  const result = pdPercent/100 * (lgdPercent/100) * ead;
  if (!Number.isFinite(result)) throw new Error('Rezultatul depășește precizia numerică.');
  return result;
}
