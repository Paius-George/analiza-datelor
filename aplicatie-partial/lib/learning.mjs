export const STORAGE_KEY = 'analiza-datelor-8020-v1';
export function normalizeText(value) { return String(value ?? '').normalize('NFD').replace(/[\u0300-\u036f]/g, '').toLowerCase(); }
export function parseNumeric(value) {
  if (typeof value !== 'string' && typeof value !== 'number') return null;
  const text = String(value).trim().replace(/\s/g, '').replace(/%$/, '').replace(',', '.');
  if (!/^[+-]?(?:\d+(?:\.\d*)?|\.\d+)$/.test(text)) return null;
  const n = Number(text); return Number.isFinite(n) ? n : null;
}
export function hasAnswer(value) { return value !== undefined && value !== null && String(value).trim() !== ''; }
export function isCorrect(question, answer) {
  if (!hasAnswer(answer) || question.kind === 'written') return false;
  if (question.kind === 'mcq') return Number(answer) === question.correct;
  const n = parseNumeric(answer); return n !== null && Math.abs(n - question.correct) <= (question.tolerance ?? .02) + 1e-9;
}
export function gradeExam(questions, answers, selfScores = {}) {
  const autos = questions.filter(q => q.kind !== 'written');
  const open = questions.filter(q => q.kind === 'written');
  const correct = autos.filter(q => isCorrect(q, answers[q.id])).length;
  const pending = open.filter(q => selfScores[q.id] === undefined);
  const openScore = open.reduce((sum, q) => sum + Math.min(1, Math.max(0, Number(selfScores[q.id]) || 0)), 0);
  return { correct, autoTotal: autos.length, openTotal: open.length, remaining: pending.length,
    score: Math.round(Math.min(10, 1 + .9 * (correct + openScore)) * 100) / 100,
    final: pending.length === 0, answered: questions.filter(q => hasAnswer(answers[q.id])).length };
}
export function remainingSeconds(deadline, now = Date.now()) { return Math.max(0, Math.ceil((deadline - now) / 1000)); }
export function formatTime(seconds) { return `${Math.floor(seconds / 60).toString().padStart(2, '0')}:${(seconds % 60).toString().padStart(2, '0')}`; }
export function emptyProgress() { return { completed: [], attempts: {}, history: [], active: null, lastLesson: null, flashKnown: [] }; }
export function readProgress(raw) {
  try {
    const p = typeof raw === 'string' ? JSON.parse(raw) : raw;
    if (!p || typeof p !== 'object' || Array.isArray(p)) return emptyProgress();
    return { ...emptyProgress(), completed: Array.isArray(p.completed) ? p.completed.filter(x => typeof x === 'string') : [],
      attempts: p.attempts && typeof p.attempts === 'object' && !Array.isArray(p.attempts) ? p.attempts : {},
      history: Array.isArray(p.history) ? p.history.filter(x => x && typeof x.id === 'string' && x.answers && typeof x.answers === 'object').slice(0, 20) : [],
      active: p.active && typeof p.active.id === 'string' && Number.isFinite(p.active.deadline) && p.active.answers && typeof p.active.answers === 'object' ? p.active : null,
      lastLesson: typeof p.lastLesson === 'string' ? p.lastLesson : null,
      flashKnown: Array.isArray(p.flashKnown) ? p.flashKnown.filter(x => typeof x === 'string') : [] };
  } catch { return emptyProgress(); }
}
