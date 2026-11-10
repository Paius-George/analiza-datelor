import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
const {papers}=JSON.parse(fs.readFileSync(new URL('../content/professor-exams.json',import.meta.url)));
const near=(a,b)=>assert.ok(Math.abs(a-b)<1e-7,`${a} differs from ${b}`);
test('10 written papers preserve original five requirements, timing and /10 rubric',()=>{
 assert.equal(papers.length,10);
 assert.equal(new Set(papers.map(p=>p.id)).size,10);
 for(const p of papers){
  assert.equal(p.minutes,40);assert.equal(p.questions.length,5);
  assert.deepEqual(p.questions.map(q=>q.points),[1,2,2,2,2]);
  for(const q of p.questions){near(q.rubric.reduce((s,r)=>s+r.points,0),q.points);assert.equal(q.prompt,papers[0].questions[q.number-1].prompt);assert.ok(q.model.length>50);assert.ok(q.explanation.length>50);}
  for(const asset of [p.graph,p.csv,p.script,`/professor-exams/${p.id}-rezolvare.md`])assert.ok(fs.existsSync(new URL('../public'+asset,import.meta.url)),asset);
 }
 assert.ok(fs.existsSync(new URL('../public/professor-exams/model-profesor-original.png',import.meta.url)));
 assert.equal(papers[0].n,116);assert.equal(papers[0].p,12);
 for(const p of papers.slice(1))assert.match(p.origin,/sintetice/);
});
test('all exercise correlations, eigenvalues, factors, contributions and graph scores agree',()=>{
 for(const p of papers){
  near(p.eigenvalues.reduce((a,b)=>a+b,0),p.p);
  for(let i=0;i<p.p;i++){
   near(p.correlation[i][i],1);
   for(let j=0;j<p.p;j++)near(p.correlation[i][j],p.correlation[j][i]);
  }
  for(let j=0;j<2;j++){
   near(p.factor.reduce((s,r)=>s+r[j]**2,0),p.eigenvalues[j]);
   near(p.contributions.reduce((s,r)=>s+r[j],0),100);
   for(let i=0;i<p.p;i++)near(p.contributions[i][j],100*p.factor[i][j]**2/p.eigenvalues[j]);
   const mean=p.scores.reduce((s,r)=>s+r[j],0)/p.n;
   near(mean,0);near(p.scores.reduce((s,r)=>s+(r[j]-mean)**2,0)/(p.n-1),p.eigenvalues[j]);
   for(let i=0;i<p.p;i++)near(p.correlation[i].reduce((s,r,k)=>s+r*p.factor[k][j],0),p.factor[i][j]*p.eigenvalues[j]);
  }
  assert.equal(p.regions.length,p.n);assert.equal(p.scores.length,p.n);
 }
 near(papers[0].eigenvalues[0],6.7139575423);
});
