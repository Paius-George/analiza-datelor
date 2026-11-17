export const PARTIAL_KEY = 'cse-partial-2plus2-v1';
export const emptyPartial = () => ({ active: null, history: [] });
const record = v => v && typeof v === 'object' && !Array.isArray(v);
export function readPartial(raw, exams) {
  try {
    const data = JSON.parse(raw);
    if (!record(data)) return emptyPartial();
    function session(s, submitted) {
      const exam = exams.find(e => e.id === s?.examId);
      if (!exam || !record(s) || typeof s.id !== 'string' || !Number.isFinite(s.started) || !Number.isFinite(s.deadline) || s.deadline <= s.started || (submitted && !Number.isFinite(s.submitted))) return null;
      const answers = Object.fromEntries(exam.questions.filter(q => typeof s.answers?.[q.id] === 'string').map(q => [q.id,s.answers[q.id].slice(0,50000)]));
      const marks = {};
      if (submitted) for (const q of exam.questions) q.rubric.forEach((_,i) => {const key=`${q.id}-${i}`;if ([0,.5,1].includes(s.marks?.[key])) marks[key]=s.marks[key];});
      return {id:s.id,examId:s.examId,started:s.started,deadline:s.deadline,answers,marks,...(submitted?{submitted:s.submitted}:{})};
    }
    return {active:session(data.active,false),history:(Array.isArray(data.history)?data.history:[]).map(s=>session(s,true)).filter(Boolean).slice(0,60)};
  } catch { return emptyPartial(); }
}
export function scorePartial(exam, marks = {}) {
  const result = {theory:0,problems:0,total:0,pending:0,final:false};
  for (const q of exam.questions) q.rubric.forEach((r,i)=>{
    const mark = marks[`${q.id}-${i}`];
    if (![0,.5,1].includes(mark)) {result.pending++;return;}
    const points = r.points * mark;
    result[q.section === 'Teorie'?'theory':'problems'] += points;
  });
  result.total=result.theory+result.problems;
  result.final=result.pending===0;
  return result;
}
export function finishPartial(state, now) {
  if (!state.active) return state;
  return {active:null,history:[{...state.active,submitted:now,marks:{}},...state.history].slice(0,60)};
}
