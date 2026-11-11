"use client";
import { useEffect, useState } from "react";
import bank from "../content/professor-exams.json";
import codeBank from "../content/code-exams.json";
import { ArrowLeft, ArrowRight, Clock3, Download, GraduationCap, Printer, CheckCircle2 } from "lucide-react";
import { formatTime } from "../lib/learning.mjs";

type Attempt = { status: "running" | "review"; deadline: number; answers: Record<string, string>; marks: Record<string, number> };
type Saved = Record<string, Attempt>;
const KEY = "analiza-datelor-professor-exams-v1";
const papers = [...bank.papers.map(p => ({ ...p, source: "photo", tip: "", questions: p.questions.map(q => ({ ...q, command: "", images: [] as { src:string; alt:string }[] })) })), ...codeBank.papers];
function go(id?: string) { window.location.hash = "modele-profesor" + (id ? "/" + id : ""); }
const fmt = (v: number) => v.toLocaleString("ro-RO", { maximumFractionDigits: 2 });
export default function ProfessorExams({ id, zoom }: { id?: string; zoom: (src: string) => void }) {
  const [saved, setSaved] = useState<Saved>({});
  const [ready, setReady] = useState(false), [storageError, setStorageError] = useState(false);
  const [filter, setFilter] = useState("all");
  const [mode, setMode] = useState<"study" | "exam">("study");
  const [now, setNow] = useState(0);
  const [confirm, setConfirm] = useState<"start" | "submit" | null>(null);
  const paper = papers.find(p => p.id === id);
  const attempt = paper ? saved[paper.id] : undefined;
  const running = attempt?.status === "running";
  const seconds = running ? Math.max(0, Math.ceil((attempt.deadline - now) / 1000)) : 0;
  useEffect(() => {
    try {
      const raw = JSON.parse(localStorage.getItem(KEY) || "{}");
      const valid: Saved = {};
      for (const p of papers) {
        const a = raw?.[p.id];
        if (a && ["running", "review"].includes(a.status) && Number.isFinite(a.deadline) && a.answers && typeof a.answers === "object" && a.marks && typeof a.marks === "object") {
          valid[p.id] = { status: a.status, deadline: a.deadline, answers: Object.fromEntries(Object.entries(a.answers).filter(([,v]) => typeof v === "string")) as Record<string,string>, marks: Object.fromEntries(Object.entries(a.marks).filter(([,v]) => typeof v === "number" && [0,.5,1].includes(v))) as Record<string,number> };
        }
      }
      setSaved(valid);
    } catch { setStorageError(true); }
    setNow(Date.now()); setReady(true);
  }, []);
  useEffect(() => { if (!ready) return; try { localStorage.setItem(KEY, JSON.stringify(saved)); } catch { setStorageError(true); } }, [ready, saved]);
  useEffect(() => { setMode("study"); setConfirm(null); }, [id]);
  useEffect(() => {
    if (!ready || !Object.values(saved).some(a => a.status === "running")) return;
    const tick = () => {
      const time = Date.now(); setNow(time);
      setSaved(prev => {
        if (!Object.values(prev).some(a => a.status === "running" && a.deadline <= time)) return prev;
        return Object.fromEntries(Object.entries(prev).map(([key,a]) => [key, a.status === "running" && a.deadline <= time ? { ...a, status: "review" as const } : a]));
      });
    };
    tick(); const interval = setInterval(tick, 1000); return () => clearInterval(interval);
  }, [ready, Object.values(saved).filter(a => a.status === "running").map(a => a.deadline).join(",")]);
  function start() {
    if (!paper) return;
    setSaved(prev => ({ ...prev, [paper.id]: { status: "running", deadline: Date.now() + 40 * 60 * 1000, answers: {}, marks: {} } }));
    setNow(Date.now()); setMode("exam"); setConfirm(null);
  }
  function update(patch: Partial<Attempt>) { if (paper && attempt) setSaved(prev => ({ ...prev, [paper.id]: { ...prev[paper.id], ...patch } })); }
  function downloadAnswers() {
    if (!paper || !attempt) return;
    const text = `Model ${paper.number} — ${paper.title}\nRăspunsuri proprii; evaluare după barem orientativ.\n\n` + paper.questions.map(q => `${q.number}. ${q.prompt}\n\n${attempt.answers[q.number] || "Fără răspuns"}\n`).join("\n");
    const a = document.createElement("a"), url = URL.createObjectURL(new Blob([text], { type: "text/plain;charset=utf-8" })); a.href=url; a.download=`${paper.id}-raspunsurile-mele.txt`; a.click(); URL.revokeObjectURL(url);
  }
  if (!paper) return <section className="professor-section"><div className="page-heading"><div><p className="eyebrow">MODELUL PROFESORULUI · INTERPRETARE ACP</p><h1>20 de teste. Formatul profesorului, pas cu pas.</h1><p>5 cerințe scrise, 40 de minute, 9 puncte + 1 punct din oficiu. 10 modele după fotografie + 10 variante noi după codul R al profesorului (11–20).</p></div></div><div className="prof-intro"><GraduationCap size={26}/><div><strong>Exersează răspunsul pe care îl vei scrie de mână.</strong><p>Fiecare variantă are outputuri, grafic, explicații simple, răspunsuri-model și barem orientativ. Rezolvă întâi pe hârtie. În simulare, soluțiile apar după predare; nota este o autoevaluare, nu o corectare automată a textului.</p><button className="text-button" onClick={() => zoom("/professor-exams/model-profesor-original.png")}>Vezi fotografia cu subiectul original <ArrowRight size={14}/></button></div></div><div className="prof-roadmap"><strong>Ordinea care te ajută să reții</strong><p>1–2: citește modelul și rescrie fără să copiezi. 3–6: rezolvă pe hârtie, apoi compară. 7–10: cronometrează 40 de minute. Apoi 11–20: exersează outputurile din codul profesorului și repetă cerințele unde pierzi puncte.</p></div><details className="prof-dictionary"><summary>Vezi codul profesorului și legătura cu cele 5 cerințe</summary><p>1. cor(scale(X)) → corelații; 2. summary(acp), plot(acp) → alegerea componentelor; 3. cor(X, scoruri), corrplot(MF) → matricea factor; 4. summary(acp2), Variables → Dim / ctr / cos2; 5. fviz_pca_ind(acp2) → regiunile.</p><div className="r-output"><pre>{codeBank.commands}</pre></div><a className="text-button" href="/professor-exams/cod-profesor.R" download>Descarcă transcrierea codului <Download size={14}/></a><p>Documentul primit conține comenzi, fără date sau outputuri. Variantele 11–20 folosesc date sintetice și rezultate didactice calculate matematic în Python, fără rulare R. Nu reprezintă subiecte viitoare confirmate.</p><p>Repere tehnice: <a href="https://stat.ethz.ch/R-manual/R-devel/library/stats/html/princomp.html" target="_blank" rel="noreferrer">R princomp</a> · <a href="https://github.com/cran/FactoMineR/blob/master/R/summary.PCA.r" target="_blank" rel="noreferrer">format summary.PCA</a></p></details><div className="prof-mode" aria-label="Serii de teste">{[{id:"all",label:"Toate · 20"},{id:"code",label:"Noi: codul profesorului · 11–20"},{id:"photo",label:"Primele modele · 1–10"}].map(f => <button key={f.id} aria-pressed={filter === f.id} className={`button ${filter === f.id ? "button-primary" : "button-outline"}`} onClick={() => setFilter(f.id)}>{f.label}</button>)}</div><div className="prof-grid">{papers.filter(p => filter === "all" || (filter === "code" ? p.source === "professor-code" : p.source === "photo")).map(p => <article className="prof-paper-card" key={p.id}><div><span className="tag tag-soft">{p.source === "professor-code" ? "Nou · codul profesorului" : p.number === 1 ? "Modelul din fotografie" : `Antrenament ${p.number - 1}`}</span><span className="prof-paper-number">{String(p.number).padStart(2,"0")}</span></div><h2>{p.title}</h2><p>{p.source === "professor-code" ? p.tip : p.number === 1 ? "Cerințele originale, aplicate pe datele proiectului tău." : "Aceleași cinci cerințe, outputuri și regiuni diferite."}</p><small>{p.n} regiuni · {p.p} indicatori · 40 min</small>{saved[p.id] && <p className="prof-status">{saved[p.id].status === "running" ? "Simulare în curs — cronometrul continuă" : "Răspunsuri salvate · poți reveni la corectare"}</p>}<button className="button button-primary" onClick={() => go(p.id)}>Deschide testul <ArrowRight size={16}/></button></article>)}</div></section>;
  const exam = mode === "exam" && !!attempt;
  const showSolutions = !running && (!exam || attempt?.status === "review");
  const count = Object.values(attempt?.answers || {}).filter(a => a.trim()).length;
  const rubricCount = paper.questions.reduce((s,q) => s+q.rubric.length,0);
  const marked = paper.questions.reduce((s,q) => s+q.rubric.filter((_,i) => attempt?.marks[`${q.number}-${i}`] !== undefined).length,0);
  const score = 1 + paper.questions.reduce((s,q) => s+q.rubric.reduce((v,r,i) => v+r.points*(attempt?.marks[`${q.number}-${i}`] || 0),0),0);
  return <section className="professor-section">
    <button className="text-button prof-back" onClick={() => go()}><ArrowLeft size={15}/> Toate cele {papers.length} teste</button>
    <div className="page-heading"><div><p className="eyebrow">{paper.source === "professor-code" ? "NOU · DUPĂ COD TEST ACP.DOCX" : paper.number === 1 ? "CERINȚE DIN FOTOGRAFIA PROFESORULUI" : "VARIANTĂ CREATĂ DUPĂ MODELUL PROFESORULUI"}</p><h1>Model {String(paper.number).padStart(2,"0")} · {paper.title}</h1><p>{paper.origin}</p></div></div>
    {storageError && <p role="status" className="storage-note">Salvarea locală nu este disponibilă. Descarcă răspunsurile înainte să închizi pagina.</p>}
    <div className="prof-toolbar"><span><Clock3 size={17}/> 40 minute · 9p + 1p oficiu</span><div><button className="button button-outline" onClick={() => {
      const details = Array.from(document.querySelectorAll<HTMLDetailsElement>(".professor-section details"));
      const wasOpen = details.map(d => d.open);
      details.forEach(d => { d.open = true; });
      window.addEventListener("afterprint", () => details.forEach((d,i) => { d.open = wasOpen[i]; }), { once:true });
      window.print();
    }}><Printer size={15}/> Tipărește</button><a className="button button-outline" download href={paper.csv}>Date CSV</a><a className="button button-outline" download href={paper.script}>Script R</a></div></div>
    <details className="prof-dictionary"><summary>Ce înseamnă X1, X2…? Deschide lista indicatorilor.</summary><dl>{paper.variables.map(v => <div key={v.code}><dt>{v.code}</dt><dd>{v.name}</dd></div>)}</dl><p>ACP este calculată pe variabile standardizate (matricea de corelație). Matricea factor conține corelații variabilă–componentă. Datele și toate outputurile dintr-o variantă provin din aceeași analiză.</p><p>{paper.source === "professor-code" ? "Scriptul reproduce comenzile profesorului și necesită corrplot, factoextra și FactoMineR, instalate manual o singură dată. Codul este oferit pentru rulare manuală. " : "Scriptul R folosește doar funcții de bază. "}Descarcă-l împreună cu CSV-ul și setează folderul de lucru. Semnul axelor poate fi inversat de alte funcții ACP; sensul interpretării se inversează împreună cu axa.</p></details>
    {paper.tip && <div className="prof-roadmap"><strong>Capcana pe care o exersezi în acest test</strong><p>{paper.tip}</p></div>}<div className="prof-mode"><button className={`button ${!exam ? "button-primary" : "button-outline"}`} onClick={() => setMode("study")}>Studiază rezolvarea</button>{attempt && <button className={`button ${exam ? "button-primary" : "button-outline"}`} onClick={() => setMode("exam")}>{running ? "Continuă simularea" : "Răspunsurile și autoevaluarea mea"}</button>}<button className="button button-outline" disabled={!ready || running} onClick={() => setConfirm("start")}>{attempt ? "Reia simularea de 40 min" : "Simulează 40 min"}</button>{!running && <a className="text-button" download href={`/professor-exams/${paper.id}-rezolvare.md`}>Descarcă rezolvarea MD <Download size={14}/></a>}</div>
    {running && <div className="prof-timer" role="status"><span><Clock3 size={18}/> {formatTime(seconds)} · {count}/5 răspunsuri</span><span>Soluțiile sunt ascunse pe durata simulării.</span><button className="button button-primary" onClick={() => setConfirm("submit")}>Predă testul</button></div>}
    {attempt?.status === "review" && exam && <div className="prof-score"><CheckCircle2 size={24}/><div><strong>{marked === rubricCount ? `Nota orientativă: ${fmt(score)} / 10` : `Puncte bifate: ${fmt(score)} / 10 · autoevaluare incompletă`}</strong><p>Include 1 punct din oficiu. Compară fiecare răspuns cu modelul și aplică baremul de mai jos ({marked}/{rubricCount} criterii evaluate). Profesorul poate puncta diferit.</p><button className="text-button" onClick={downloadAnswers}>Descarcă răspunsurile mele <Download size={14}/></button></div></div>}
    {confirm && <div className="prof-confirm" role="alert"><strong>{confirm === "start" ? (attempt ? "Reiei testul? Răspunsurile și autoevaluarea anterioare pentru această variantă vor fi înlocuite." : "Ai 40 de minute. Pregătește o foaie și încearcă întâi fără rezolvare.") : `Predai ${count} din 5 răspunsuri? După predare poți vedea soluțiile și te poți autoevalua.`}</strong><div><button className="button button-primary" onClick={() => { if(confirm === "start") start(); else { update({status:"review"});setMode("exam");setConfirm(null); } }}>{confirm === "start" ? "Începe cronometrul" : "Predă și vezi rezolvarea"}</button><button className="button button-outline" onClick={() => setConfirm(null)}>Înapoi</button></div></div>}
    <div className="prof-instructions"><strong>Cum folosești outputurile</strong><p>La fiecare cerință: numește ce citești → citează valori → explică în cuvinte → formulează concluzia. Baremul de aici este orientativ. La cerința 2 folosim Kaiser și un prag explicit de 80% din variația cumulată.</p></div>
    {paper.questions.map(q => <article className="prof-question" key={q.number}><header><span className="prof-q-number">{q.number}</span><h2>{q.prompt}</h2><span className="tag tag-soft">{q.points}p</span></header>{q.command && <div className="r-output"><div>Comenzile corespunzătoare din codul profesorului</div><pre tabIndex={0}>{q.command}</pre></div>}<div className="r-output"><div><span className="r-badge">R</span> {q.number === 5 ? "Coordonatele unor regiuni și calitatea reprezentării în plan" : "Output pentru interpretare"}</div><pre tabIndex={0}>{q.output}</pre></div>{q.images.map(im => <button className="prof-graph" key={im.src} onClick={() => zoom(im.src)} aria-label={`Mărește: ${im.alt}`}><img src={im.src} alt={im.alt}/><span>{im.alt} · mărește</span></button>)}{q.number === 5 && <><p className="prof-graph-note">Grafic de verificare pentru cerința 5. La test trebuie să generezi și tu reprezentarea pe computer; descrierea singură nu înlocuiește graficul.</p><button className="prof-graph" onClick={() => zoom(paper.graph)} aria-label="Mărește graficul regiunilor"><img src={paper.graph} alt={`Regiunile din modelul ${paper.number}, reprezentate pe componentele 1 și 2`}/><span>Mărește graficul</span></button><a className="text-button" download href={paper.graph}>Descarcă graficul SVG <Download size={14}/></a></>}{exam && <label className="answer-label">Răspunsul meu la cerința {q.number}<textarea rows={6} value={attempt?.answers[q.number] || ""} disabled={!running} onChange={e => { if (Date.now() >= attempt!.deadline) { update({status:"review"}); return; } update({answers:{...attempt!.answers,[q.number]:e.target.value}}); }} placeholder="Poți scrie pe foaie și transcrie concluziile aici. Citează valori concrete…"/></label>}{showSolutions && <details className="prof-solution" open={exam || undefined}><summary>Vezi rezolvarea și baremul · {q.points}p</summary><div><p className="eyebrow">PE ÎNȚELESUL TĂU</p><p>{q.explanation}</p><div className="model-box"><strong>Răspuns-model pentru scris de mână</strong><p>{q.model}</p></div><strong>Barem orientativ</strong>{q.rubric.map((r,i) => <div className="prof-rubric" key={i}><span>{r.label} <strong>({fmt(r.points)}p)</strong></span>{exam ? <label><span className="sr-only">Autoevaluare: {r.label}</span><select aria-label={`Cerința ${q.number}, criteriul ${i+1}`} value={attempt?.marks[`${q.number}-${i}`] ?? ""} onChange={e => {const marks={...attempt!.marks}; if(e.target.value === "") delete marks[`${q.number}-${i}`];else marks[`${q.number}-${i}`]=Number(e.target.value);update({marks});}}><option value="">Alege punctajul</option><option value="0">Nu am explicat · 0p</option><option value="0.5">Parțial · {fmt(r.points*.5)}p</option><option value="1">Complet · {fmt(r.points)}p</option></select></label> : null}</div>)}</div></details>}</article>)}
    <div className="prof-bottom"><button className="button button-outline" onClick={() => go()}>Toate modelele</button>{paper.number < papers.length && <button className="button button-primary" onClick={() => go(papers[paper.number].id)}>Următorul test <ArrowRight size={16}/></button>}</div>
  </section>;
}
