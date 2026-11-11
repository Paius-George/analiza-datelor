import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
const {papers,commands}=JSON.parse(fs.readFileSync(new URL('../content/code-exams.json',import.meta.url)));
const original=JSON.parse(fs.readFileSync(new URL('../content/professor-exams.json',import.meta.url))).papers;
const near=(a,b)=>assert.ok(Math.abs(a-b)<1e-7,`${a} != ${b}`);
const asset=p=>fs.readFileSync(new URL('../public'+p,import.meta.url),'utf8');
test('ten additional papers retain professor commands, all five prompts and the original rubric',()=>{
 assert.deepEqual(papers.map(p=>p.number),[11,12,13,14,15,16,17,18,19,20]);
 assert.equal(new Set([...original,...papers].map(p=>p.id)).size,20);
 for(const command of ['cor(scale(X,center=T,scale=T))','acp <- princomp(X,cor=T,scores=TRUE)','summary(acp)','plot(acp,type="l")','scoruri <- acp$scores','MF=cor(X,scoruri)','library(corrplot)','corrplot(MF,method="number")','library(factoextra)','library(FactoMineR)','acp2 <- PCA(X,scale.unit=T,graph=T)','acp2','summary(acp2)','fviz_pca_ind(acp2)'])assert.ok(commands.split('\n').includes(command),command);
 for(const p of papers){
  assert.equal(p.minutes,40);assert.match(p.origin,/sintetice/);assert.match(p.origin,/fără rulare R/);
  assert.equal(p.questions.length,5);assert.deepEqual(p.questions.map(q=>q.points),[1,2,2,2,2]);
  assert.ok(asset(p.script).includes(commands));assert.ok(asset(p.graph).includes('<svg'));
  assert.ok(asset(`/professor-exams/${p.id}-rezolvare.md`).includes(p.questions[3].model));
  for(const q of p.questions){assert.equal(q.prompt,original[0].questions[q.number-1].prompt);near(q.rubric.reduce((s,r)=>s+r.points,0),q.points);assert.ok(q.command);for(const im of q.images)assert.ok(asset(im.src).includes('<svg'));}
 }
 assert.ok(papers.some(p=>p.p>10));assert.ok(papers.some(p=>p.axisSigns.includes(-1)));
});
test('new tables and graphs share the PCA definitions, including princomp/PCA axis signs and divisor n',()=>{
 for(const p of papers){
  near(p.eigenvalues.reduce((s,v)=>s+v,0),p.p);
  assert.equal(p.scoreDivisor,'n');assert.equal(p.scores.length,p.n);
  const csv=asset(p.csv).trim().split('\n').map(line=>line.split(','));
  assert.equal(csv.length,p.n+1);
  const X=csv.slice(1).map(row=>row.slice(1).map(Number));
  const means=Array.from({length:p.p},(_,j)=>X.reduce((s,r)=>s+r[j],0)/p.n);
  const sd=means.map((m,j)=>Math.sqrt(X.reduce((s,r)=>s+(r[j]-m)**2,0)/p.n));
  const Z=X.map(row=>row.map((v,j)=>(v-means[j])/sd[j]));
  for(let j=0;j<2;j++){
   near(p.factor.reduce((s,r)=>s+r[j]**2,0),p.eigenvalues[j]);
   near(p.contributions.reduce((s,r)=>s+r[j],0),100);
   near(p.individualContributions.reduce((s,r)=>s+r[j],0),100);
   near(p.scores.reduce((s,r)=>s+r[j]**2,0)/p.n,p.eigenvalues[j]);
   for(let i=0;i<p.p;i++){
    near(p.factorPrincomp[i][j]*p.axisSigns[j],p.factor[i][j]);
    near(p.variableCos2[i][j],p.factor[i][j]**2);
    near(p.contributions[i][j],100*p.factor[i][j]**2/p.eigenvalues[j]);
    near(Z.reduce((s,row,k)=>s+row[i]*p.scores[k][j],0)/p.n/Math.sqrt(p.eigenvalues[j]),p.factor[i][j]);
   }
   for(let i=0;i<p.n;i++){
    const distance=Z[i].reduce((s,v)=>s+v*v,0);
    near(p.individualCos2[i][j],p.scores[i][j]**2/distance);
    near(p.individualContributions[i][j],100*p.scores[i][j]**2/(p.n*p.eigenvalues[j]));
   }
  }
  for(let i=0;i<p.p;i++)for(let j=0;j<p.p;j++)near(p.correlation[i][j],Z.reduce((s,r)=>s+r[i]*r[j],0)/p.n);
 }
});
