import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync, existsSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { CSE_STORAGE_KEY, parseDistribution, analyzeDistributions, classifyIndicator, expectedLoss } from '../lib/cse.mjs';
import { STORAGE_KEY, gradeExam } from '../lib/learning.mjs';
const bank=JSON.parse(readFileSync(new URL('../content/cse.json',import.meta.url)));
const close=(a,b,t=1e-9)=>assert.ok(Math.abs(a-b)<t,`${a} != ${b}`);
test('CSE: lectiile, intrebarile, sursele si modulele au referinte valide',()=>{
 assert.notEqual(CSE_STORAGE_KEY,STORAGE_KEY);
 for(const name of ['modules','lessons','questions','exams','sources'])assert.equal(new Set(bank[name].map(x=>x.id)).size,bank[name].length);
 for(const m of bank.modules){assert.ok(m.lessons.length>0);assert.ok(bank.questions.some(q=>q.category===m.id));for(const id of m.lessons)assert.equal(bank.lessons.find(l=>l.id===id)?.module,m.id);}
 for(const l of bank.lessons){for(const key of ['core','explanation','example','model','pitfall','recall'])assert.ok(l[key]?.length>10);for(const s of l.sources)assert.ok(bank.sources.some(x=>x.id===s));}
 for(const q of bank.questions){assert.ok(bank.lessons.some(l=>l.id===q.lesson));assert.ok(q.model||q.explanation);if(q.kind==='mcq'){assert.equal(q.choices.length,4);assert.equal(new Set(q.choices).size,4);assert.ok(Number.isInteger(q.correct)&&q.correct>=0&&q.correct<4);}if(q.kind==='written')assert.ok(q.rubric.length>=3);}
 for(const s of bank.sources.filter(s=>s.href.startsWith('/')))assert.ok(existsSync(fileURLToPath(new URL('../public'+s.href,import.meta.url))),s.href);
});
test('CSE: simulari de 10 intrebari, barem complet si nota 10 pentru raspunsuri corecte',()=>{
 for(const e of bank.exams){assert.equal(e.questions.length,10);assert.equal(new Set(e.questions).size,10);const qs=e.questions.map(id=>bank.questions.find(q=>q.id===id));assert.ok(qs.every(Boolean));assert.equal(qs.filter(q=>q.kind==='written').length,3);const answers=Object.fromEntries(qs.map(q=>[q.id,q.kind==='written'?'raspuns propriu':q.correct]));const marks=Object.fromEntries(qs.filter(q=>q.kind==='written').map(q=>[q.id,1]));assert.equal(gradeExam(qs,answers,marks).score,10);assert.equal(gradeExam(qs,answers).final,false);}
});
test('PSI, HHI si entropia reproduc aplicatia manuala din simulare',()=>{
 const r=analyzeDistributions([50,30,20],[40,35,25]);
 close(r.psi,.04118,5e-6);close(r.hhi,.345);close(r.hhiNormalized,.0175);
 const z=analyzeDistributions([50,30,20],[50,30,20]);close(z.hhi,.38);close(z.hhiNormalized,.07);close(z.entropyNormalized,.9372305632161295);
 close(bank.questions.find(q=>q.id==='n-psi').correct,r.psi);close(bank.questions.find(q=>q.id==='n-entropy').correct,z.entropyNormalized);
});
test('PSI normalizeaza separat totaluri diferite, fara a modifica ponderile',()=>{
 const r=analyzeDistributions([5,3,2],[50,30,20]);close(r.psi,0);close(r.q.reduce((a,b)=>a+b),1);
 const other=analyzeDistributions([80,20],[20,80]);assert.ok(other.psi>.25);close(other.hhi,analyzeDistributions([80,20],[80,20]).hhi);
});
test('valorile zero nu sunt inlocuite tacit; HHI si entropia raman definite',()=>{
 const r=analyzeDistributions([1,1,1],[1,0,0]);assert.equal(r.psi,null);assert.ok(r.psiNote);close(r.entropyNormalized,0);close(r.hhiNormalized,1);
 const equal=analyzeDistributions([1,1,1],[10,10,10]);close(equal.entropyNormalized,1);close(equal.hhiNormalized,0);
});
test('pragurile exacte din seminar intra in zona galbena',()=>{
 for(const v of [.1,.25])assert.equal(classifyIndicator('psi',v).color,'amber');
 for(const v of [.1,.2])assert.equal(classifyIndicator('hhi',v).color,'amber');
 for(const v of [.6,.9])assert.equal(classifyIndicator('entropy',v).color,'amber');
 assert.equal(classifyIndicator('entropy',.91).color,'green');assert.equal(classifyIndicator('entropy',.59).color,'red');assert.equal(classifyIndicator('psi',.251).color,'red');assert.equal(classifyIndicator('hhi',.201).color,'red');
});
test('calculatorul accepta zecimale romanesti si respinge date invalide',()=>{
 assert.deepEqual(parseDistribution('0,5; 0,3; 0,2'),[.5,.3,.2]);assert.deepEqual(parseDistribution('50 30 20'),[50,30,20]);
 for(const t of ['', '0;0','1;-2','1;abc','1','Infinity;1'])assert.throws(()=>parseDistribution(t));
 for(const [p,q] of [[[1,2],[1]],[[0,0],[1,2]],[[-1,2],[1,2]],[[Infinity,2],[1,2]]])assert.throws(()=>analyzeDistributions(p,q));
});
test('ECL transforma procentele si pastreaza unitatea EAD',()=>{
 close(expectedLoss(.15,60,1100),.99);close(expectedLoss(2,40,100000),800);assert.equal(expectedLoss(0,100,10),0);
 for(const args of [[101,50,1],[1,-1,1],[1,1,-1],[NaN,1,1]])assert.throws(()=>expectedLoss(...args));
});
