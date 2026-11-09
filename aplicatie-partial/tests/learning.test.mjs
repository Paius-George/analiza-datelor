import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import { parseNumeric, hasAnswer, isCorrect, gradeExam, remainingSeconds, readProgress, normalizeText } from '../lib/learning.mjs';
const { questions, exams, flashcards } = JSON.parse(fs.readFileSync(new URL('../content/practice.json', import.meta.url)));
const theory = JSON.parse(fs.readFileSync(new URL('../content/theory.json', import.meta.url)));
const root = new URL('../', import.meta.url);
test('accepta virgula, punctul si procentele; refuza raspunsuri goale sau expresii', () => {
 assert.equal(parseNumeric(' 85,06 % '),85.06); assert.equal(parseNumeric('0.516'),.516);
 for(const s of ['', 'abc','1,2,3','2+2',undefined]) assert.equal(parseNumeric(s),null);
 assert.equal(hasAnswer(0),true); assert.equal(hasAnswer(''),false);
});
test('indicele zero este raspuns valid, iar toleranta numerica este respectata', () => {
 assert.equal(isCorrect({kind:'mcq',correct:0},0),true);
 assert.equal(isCorrect({kind:'numeric',correct:85.06,tolerance:.02},'85,06'),true);
 assert.equal(isCorrect({kind:'numeric',correct:3,tolerance:0},'3.1'),false);
 assert.equal(isCorrect({kind:'numeric',correct:0},''),false);
});
test('nota finala nu include evaluare automata inventata a interpretarilor libere', () => {
 const qs=exams[0].questions.map(id=>questions.find(q=>q.id===id));
 const answers=Object.fromEntries(qs.map(q=>[q.id,q.kind==='written'?'Interpretare':q.correct]));
 const partial=gradeExam(qs,answers,{});
 assert.equal(partial.score,8.2); assert.equal(partial.final,false); assert.equal(partial.remaining,2);
 const opens=qs.filter(q=>q.kind==='written');
 const final=gradeExam(qs,answers,Object.fromEntries(opens.map(q=>[q.id,1])));
 assert.equal(final.score,10); assert.equal(final.final,true);
 assert.equal(gradeExam(qs,{},{}).score,1);
});
test('cronometru si progres rezistente la refresh sau date invalide', () => {
 assert.equal(remainingSeconds(2000,1001),1); assert.equal(remainingSeconds(1,2000),0);
 assert.deepEqual(readProgress('corupt').completed,[]);
 assert.equal(readProgress('{"active":{"id":"x"}}').active,null);
 assert.deepEqual(readProgress('{"completed":["acp-1"]}').completed,['acp-1']);
 assert.equal(normalizeText('Contribuție și VARIAȚIE'),'contributie si variatie');
});
test('patru variante complete, cu barem si exact doua interpretari fiecare', () => {
 assert.equal(exams.length,4); assert.equal(new Set(questions.map(q=>q.id)).size,40);
 for(const e of exams){const qs=e.questions.map(id=>questions.find(q=>q.id===id));assert.equal(qs.length,10);assert.ok(qs.every(Boolean));assert.equal(qs.filter(q=>q.kind==='written').length,2);}
 for(const q of questions){if(q.kind==='mcq'){assert.ok(q.correct>=0&&q.correct<q.choices.length);} if(q.kind==='written'){assert.ok(q.model&&q.rubric.length===3);}else assert.ok(q.explanation);}
 assert.equal(flashcards.length,20);
});
test('toate lectiile, fisele originale si imaginile sunt incluse in aplicatie', () => {
 assert.equal(theory.modules.length,8); assert.equal(theory.lessons.length,73);
 assert.ok(theory.modules.some(m=>m.id==='corespondente')); assert.ok(theory.modules.some(m=>m.id==='test-scris'));
 assert.ok(fs.existsSync(new URL('public/materiale/Seminar%207.pdf',root)));
 for(const m of theory.modules){assert.ok(m.lessons.every(id=>theory.lessons.some(l=>l.id===id)));assert.ok(fs.existsSync(new URL('public/materiale/'+m.file,root)));}
 for(const l of theory.lessons){for(const [,src] of l.html.matchAll(/src="([^"]+)"/g)) assert.ok(fs.existsSync(new URL('public'+src,root)),src);}
 for(const q of questions)if(q.image)assert.ok(fs.existsSync(new URL('public/theory/images/'+q.image,root)));
});
