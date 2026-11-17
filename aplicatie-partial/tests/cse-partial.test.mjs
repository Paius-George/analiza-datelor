import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync,existsSync} from 'node:fs';
import {PARTIAL_KEY,readPartial,scorePartial,finishPartial} from '../lib/cse-partial.mjs';
import {CSE_STORAGE_KEY,classifyIndicator} from '../lib/cse.mjs';
import {STORAGE_KEY} from '../lib/learning.mjs';
const read=name=>JSON.parse(readFileSync(new URL(`../content/${name}.json`,import.meta.url)));
const bank=read('cse-partial'),content=read('cse'),guide=read('cse-guide');
const close=(a,b,t=1e-10)=>assert.ok(Math.abs(a-b)<t,`${a} != ${b}`);
const number=s=>Number(s.replace(/\./g,'').replace(',','.'));
test('60 variante distincte: 2 puncte teorie + 2 probleme, barem și referințe complete',()=>{
 assert.equal(bank.exams.length,60);
 assert.equal(new Set(bank.exams.map(e=>e.id)).size,60);
 assert.equal(new Set(bank.exams.map(e=>e.questions.map(q=>q.prompt).join('|'))).size,60);
 assert.equal(new Set(bank.exams.map(e=>JSON.stringify(e.questions[4].inputs))).size,60);
 for(const e of bank.exams){
  for(const section of ['Teorie','Probleme'])close(e.questions.filter(q=>q.section===section).reduce((a,q)=>a+q.points,0),2);
  for(const q of e.questions){close(q.rubric.reduce((a,r)=>a+r.points,0),q.points);assert.ok(q.solution.length>100);for(const id of q.sources)assert.ok(content.sources.some(s=>s.id===id),id);}
  const marks=Object.fromEntries(e.questions.flatMap(q=>q.rubric.map((_,i)=>[`${q.id}-${i}`,1])));
  const s=scorePartial(e,marks);close(s.total,4);close(s.theory,2);close(s.problems,2);assert.equal(s.final,true);
  const partial=scorePartial(e,{...marks,'q1-0':.5});close(partial.total,3.9);
  delete marks['q1-0'];assert.equal(scorePartial(e,marks).final,false);
 }
});
test('fiecare variantă are exact trei situații IT și cuprinde ERP, CRM și SCM',()=>{
 for(const e of bank.exams){const q=e.questions[3];assert.equal(q.prompt.split('\n').length,4);for(const term of ['ERP','CRM','SCM'])assert.ok(q.solution.includes(term));assert.ok(q.solution.includes('nu CRL'));}
 const topics=new Set(bank.exams.flatMap(e=>e.focus));
 for(const t of ['VSM: S2 și S3','VSM: activități primare','Explorarea posibilităților','Departe de echilibru','Istoricitate','Banca: coevoluție','Shadow banking: exemple','Firma: cinci subsisteme'])assert.ok(topics.has(t),t);
});
test('verificare independentă a tuturor tabelelor numerice și a culorilor',()=>{
 const colors={psi:new Set(),hhi:new Set(),entropy:new Set()};let differentTotals=0;
 for(const e of bank.exams){
  const psiQ=e.questions[4],hQ=e.questions[5];const {base,current}=psiQ.inputs;
  const a=base.reduce((s,v)=>s+v,0),b=current.reduce((s,v)=>s+v,0);if(a!==b)differentTotals++;
  const p=base.map(v=>v/a),q=current.map(v=>v/b),n=q.length;
  const contributions=p.map((v,i)=>(q[i]-v)*(Math.log(q[i])-Math.log(v)));
  const psi=contributions.reduce((s,v)=>s+v,0);
  const hhi=q.reduce((s,v)=>s+v*v,0),h=-q.reduce((s,v)=>s+v*Math.log(v),0);
  const hn=(hhi-1/n)/(1-1/n),en=h/Math.log(n);
  for(let j=0;j<n;j++){
   const row=psiQ.solutionTable.rows[j];close(number(row[1]),p[j],.00000051);close(number(row[2]),q[j],.00000051);close(number(row[3]),contributions[j],.00000051);
   const hr=hQ.solutionTable.rows[j];close(number(hr[2]),q[j]**2,.00000051);close(number(hr[3]),-q[j]*Math.log(q[j]),.00000051);
  }
  for(const [metric,value,solution] of [['psi',psi,psiQ.solution],['hhi',hn,hQ.solution],['entropy',en,hQ.solution]]){
   const c=classifyIndicator(metric,value);colors[metric].add(c.color);assert.ok(solution.includes(c.name.toLowerCase()));assert.ok(solution.includes(value.toLocaleString('ro-RO',{maximumFractionDigits:6})));}
  assert.ok(hhi>=1/n-1e-12&&hhi<=1);assert.ok(en>=0&&en<=1+1e-12);
 }
 assert.ok(differentTotals>30);
 for(const c of Object.values(colors))assert.deepEqual([...c].sort(),['amber','green','red']);
});
test('ghidul acoperă toate temele și toate legăturile spre lecții și surse',()=>{
 assert.equal(guide.sections.length,7);assert.equal(guide.sections.reduce((a,s)=>a+s.minutes,0),85);
 for(const s of guide.sections){assert.ok(s.model.split('.').length>=3);for(const id of s.lessons)assert.ok(content.lessons.some(l=>l.id===id));for(const id of s.sources)assert.ok(content.sources.some(x=>x.id===id));for(const r of s.rows)assert.equal(r.length,s.headers.length);}
 assert.ok(guide.sections.find(s=>s.id==='shadow').trap.includes('nu reproducerea'));
 for(const f of ['ghid-partial-80-20.md','variante-partial-60.md'])assert.ok(existsSync(new URL('../public/cse/'+f,import.meta.url)));
});
test('progres separat, restaurare sigură, bareme validate și predare idempotentă',()=>{
 assert.notEqual(PARTIAL_KEY,CSE_STORAGE_KEY);assert.notEqual(PARTIAL_KEY,STORAGE_KEY);
 const session={id:'test',examId:bank.exams[0].id,started:100,deadline:200,answers:{q1:'Răspuns',ghost:'bad'},marks:{'q1-0':100}};
 const restored=readPartial(JSON.stringify({active:session,history:[]}),bank.exams);assert.deepEqual(restored.active.answers,{q1:'Răspuns'});assert.deepEqual(restored.active.marks,{});
 const finished=finishPartial(restored,220);assert.equal(finished.active,null);assert.equal(finished.history[0].answers.q1,'Răspuns');assert.equal(finished.history[0].submitted,220);
 assert.deepEqual(finishPartial(finished,230),finished);
 const saved=readPartial(JSON.stringify({...finished,history:[{...finished.history[0],marks:{'q1-0':1,'q1-1':Infinity,'q1-2':.5,'ghost':1}}]}),bank.exams);
 assert.deepEqual(saved.history[0].marks,{'q1-0':1,'q1-2':.5});
 for(const raw of ['bad','null','[]','{}',JSON.stringify({active:{...session,deadline:50}}),JSON.stringify({active:{...session,examId:'missing'}})])assert.equal(readPartial(raw,bank.exams).active,null);
});
