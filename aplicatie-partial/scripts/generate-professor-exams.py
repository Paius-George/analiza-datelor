"""Build reproducible PCA exercises. Does not execute R or change seminar analyses."""
from pathlib import Path
import csv, json
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
ROOT=Path(__file__).resolve().parents[1]
OUT=ROOT/'public/professor-exams'; OUT.mkdir(exist_ok=True)
PROMPTS=[
'Analizați matricea de corelație pentru datele numerice inițiale. Formulați o concluzie privind aplicarea analizei componentelor principale.',
'Folosiți două criterii pentru a decide numărul de componente păstrate în analiză.',
'Folosiți matricea factor pentru a interpreta a doua componentă principală.',
'Din outputul numeric privind variabilele interpretați coloanele Dim1, Dim2 (corelații) și ctr (contribuții) pentru primele două componente principale.',
'Reprezentați grafic regiunile într-un spațiu definit de primele două componente principale. Extrageți 2 concluzii.']
names0=['Internet acasă','Internet zilnic','Internet banking','Cumpărături online','PIB pe locuitor (PPS)','Ocupare 20–64 ani','Șomaj 20–64 ani','Șomaj tineri','Studii superioare','Formare adulți','NEET','Densitatea populației']
themes=[('Digitalizare și piața muncii',names0),('Educație și ocupare',['Studii superioare','Formare adulți','Absolvenți STEM','Ocupare totală','Ocuparea femeilor','Șomaj','NEET','Abandon școlar']),('Inovare regională',['Cercetători','Cheltuieli cercetare','Brevete','Firme inovatoare','Productivitate','Șomaj','Ocupare','Formare adulți']),('Acces digital',['Internet acasă','Internet zilnic','Servicii publice online','Cumpărături online','Internet banking','Excludere digitală','Competențe digitale','Acces rural']),('Turism și economie',['Înnoptări turistice','Capacitate cazare','Ocupare în turism','PIB pe locuitor','Ocupare totală','Șomaj','Accesibilitate','Densitate']),('Mediu și urbanizare',['Transport public','Spații verzi','Reciclare','Energie regenerabilă','Poluare','Trafic auto','Densitate','Consum de energie']),('Piața muncii',['Ocupare totală','Ocuparea femeilor','Ocuparea tinerilor','Salariu mediu','Șomaj','Șomaj tineri','NEET','Formare adulți']),('Dezvoltare regională',['PIB pe locuitor','Productivitate','Investiții','Ocupare','Sărăcie','Șomaj','Studii superioare','Acces la internet']),('Demografie și servicii',['Populație tânără','Natalitate','Migrație netă','Populație vârstnică','Medici','Paturi spital','Densitate','Ocupare']),('Incluziune și competențe',['Competențe digitale','Formare adulți','Studii superioare','Ocuparea femeilor','NEET','Șomaj','Sărăcie','Acces la servicii'])]
def f(x):return f'{x:.3f}'
def table(headers, rows):
    widths=[max(len(str(h)),*(len(str(r[i])) for r in rows)) for i,h in enumerate(headers)]
    return '  '.join(str(h).ljust(w) for h,w in zip(headers,widths)).rstrip()+'\n'+'\n'.join('  '.join(str(v).ljust(w) for v,w in zip(r,widths)).rstrip() for r in rows)
def rubric(*pairs):return [{'label':a,'points':b} for a,b in pairs]
def q(i,output,model,easy,criteria):return dict(number=i+1,points=[1,2,2,2,2][i],prompt=PROMPTS[i],output=output,model=model,explanation=easy,rubric=criteria)
papers=[]
for t,(theme,names) in enumerate(themes):
    pid=f'model-{t+1:02d}'
    if t==0:
        source=ROOT.parents[0]/'Rezolvare Seminar/digitalizare.txt'
        with source.open() as stream:
            records=list(csv.reader(stream,delimiter='\t'))
        labels=[r[0] for r in records[1:] if r]
        X=np.array([[float(v) for v in r[1:]] for r in records[1:] if r])
    else:
        rng=np.random.default_rng(107100+t)
        n=60+8*t
        z=rng.normal(size=(n,3))
        weights=np.array([[.9,.2,.1],[.8,.3,0],[.7,.5,.1],[.75,-.4,.1],[-.8,.1,.2],[-.7,.5,.1],[.6,-.5,.5],[.5,.6,-.4]])
        weights=np.roll(weights,t%4,axis=0)
        X=z@weights.T+rng.normal(size=(n,8))*(.35+.06*(t%3))
        X=10+80*(X-X.min(axis=0))/(X.max(axis=0)-X.min(axis=0))
        labels=[f'R{t:02d}{i+1:03d}' for i in range(n)]
    n,p=X.shape; codes=[f'X{i+1}' for i in range(p)]
    Z=(X-X.mean(axis=0))/X.std(axis=0,ddof=1)
    R=np.corrcoef(Z,rowvar=False)
    ev,V=np.linalg.eigh(R);ev=ev[::-1];V=V[:,::-1]
    anchors=[]
    for j in range(p):
        k=([3,6,11,0][j] if t==0 and j<4 else int(np.argmax(abs(V[:,j]))))
        V[:,j]*=1 if V[k,j]>=0 else -1
        anchors.append(k+1)
    mf=V*np.sqrt(ev);scores=Z@V;ctr=100*V**2;perc=100*ev/p;cum=perc.cumsum()
    kaiser=int(sum(ev>1));k80=int(np.searchsorted(cum,80)+1)
    pairs=sorted([(abs(R[i,j]),i,j) for i in range(p) for j in range(i+1,p)],reverse=True)
    _,a,b=pairs[0];_,c,d=pairs[1]
    strong=sum(v>=.5 for v,_,_ in pairs)
    corr=f'{codes[a]}–{codes[b]}: r = {f(R[a,b])}; {codes[c]}–{codes[d]}: r = {f(R[c,d])}'
    side=lambda j,positive: sorted([i for i in range(p) if (mf[i,j]>0)==positive],key=lambda i:abs(mf[i,j]),reverse=True)[:2]
    def desc(j,pos):return ', '.join(f'{names[i]} ({codes[i]}, r = {f(mf[i,j])})' for i in side(j,pos))
    pos,neg=desc(1,True),desc(1,False)
    interpretation=f'Componenta 2 opune valorile ridicate pentru {pos} valorilor ridicate pentru {neg}.' if neg else f'Componenta 2 exprimă mai ales variația comună a indicatorilor {pos}.'
    # Sign-free, data-grounded description rather than inventing an economic label.
    dominant=[int(np.argmax(ctr[:,j])) for j in (0,1)]
    v=dominant[0];w=dominant[1];threshold=100/p
    high=int(np.argmax(scores[:,0]));low=int(np.argmin(scores[:,0]));up=int(np.argmax(scores[:,1]));down=int(np.argmin(scores[:,1]))
    quality=(scores[:,:2]**2).sum(axis=1)/(scores**2).sum(axis=1)
    region_rows=table(['Regiune','Scor PC1','Scor PC2','cos2 plan'],[[labels[i],f(scores[i,0]),f(scores[i,1]),f(quality[i])] for i in dict.fromkeys([high,low,up,down])])
    fig,ax=plt.subplots(figsize=(11,8));ax.scatter(scores[:,0],scores[:,1],s=23,c='#6b5ce0',alpha=.65)
    ax.axhline(0,c='#99a0ad',lw=.8);ax.axvline(0,c='#99a0ad',lw=.8)
    for i,label in enumerate(labels):ax.annotate(label,(scores[i,0],scores[i,1]),xytext=(3,3),textcoords='offset points',fontsize=6 if n>90 else 7,color='#222735')
    ax.set(xlabel=f'Componenta 1 ({perc[0]:.2f}%)',ylabel=f'Componenta 2 ({perc[1]:.2f}%)',title=f'Model {t+1:02d} • {theme}\nRegiuni în planul primelor două componente')
    ax.grid(alpha=.12);fig.tight_layout();fig.savefig(OUT/f'{pid}.svg');plt.close(fig)
    with (OUT/f'{pid}.csv').open('w') as stream:
        writer=csv.writer(stream,lineterminator="\n");writer.writerow(['regiune']+codes);writer.writerows([[label]+list(row) for label,row in zip(labels,X)])
    rscript='''# Date de exercițiu; rulează tu, dacă dorești. Nu necesită pachete externe.
# Salvează CSV-ul și acest script în același folder; setează acel folder în R.
d <- read.csv("PID.csv", row.names = 1, check.names = FALSE)
R <- cor(d)
e <- eigen(R, symmetric = TRUE)
V <- e$vectors
anchors <- c(ANCHORS)
for (j in seq_len(ncol(V))) if (V[anchors[j], j] < 0) V[,j] <- -V[,j]
factor <- sweep(V, 2, sqrt(e$values), "*")
rownames(factor) <- colnames(d)
colnames(factor) <- paste0("Dim", seq_len(ncol(d)))
scoruri <- scale(d) %*% V
rownames(scoruri) <- rownames(d)
print(round(R, 3))
print(round(cbind(lambda=e$values, procent=100*e$values/ncol(d), cumulat=cumsum(100*e$values/ncol(d))), 3))
print(round(factor[,1:2], 3))
print(round(cbind(Dim1=factor[,1], Dim2=factor[,2], ctr1=100*V[,1]^2, ctr2=100*V[,2]^2), 3))
plot(scoruri[,1:2], type="n", xlab="Componenta 1", ylab="Componenta 2", main="Regiuni în planul ACP")
text(scoruri[,1:2], labels=rownames(d), cex=.6)
abline(h=0,v=0,col="grey")
# Scorurile folosesc standardizarea cu abaterea standard de eșantion.
# Față de alte funcții PCA, semnul axelor sau scara scorurilor pot diferi.
'''.replace('PID',pid).replace('ANCHORS',','.join(map(str,anchors)))
    (OUT/f'{pid}.R').write_text(rscript)
    questions=[
      q(0,table(['cor()']+codes,[[code]+[f(x) for x in row] for code,row in zip(codes,R)]),f'Există asocieri între variabile: {corr}. Sunt {strong} perechi cu |r| ≥ 0,50 din {len(pairs)}. Indicatorii conțin informație comună, deci ACP este justificată ca metodă de reducere a dimensionalității; nu deducem cauzalitate din corelații.', 'Ignoră diagonala de 1. Caută valori apropiate de +1 sau −1. Semnul spune direcția; modulul spune cât de puternică este asocierea. Mai multe corelații consistente sugerează informație repetată pe care ACP o poate sintetiza. Aceasta este o justificare exploratorie, nu un test formal de adecvare.',rubric(('Citezi două corelații și sensul lor.',.5),('Legi informația comună de utilitatea ACP.',.5))),
      q(1,table(['Componentă','Valoare proprie','% variație','% cumulat'],[[i+1,f(ev[i]),f(perc[i]),f(cum[i])] for i in range(p)]),f'Prin Kaiser, pentru ACP pe variabile standardizate, păstrez {kaiser} componente cu λ > 1, care explică {cum[kaiser-1]:.2f}% din variație. Prin criteriul variației cumulate, aleg un prag explicit de 80% și păstrez {k80} componente ({cum[k80-1]:.2f}%). '+('Cele două criterii coincid.' if kaiser==k80 else f'Criteriile dau rezultate diferite. Dacă urmăresc minimum 80% informație, aleg {k80}; dacă aplic strict Kaiser, aleg {kaiser}. Pragul de 80% este o alegere de lucru, nu o regulă universală.'),'Kaiser: numeri valorile proprii strict peste 1. Cumulat: citești de sus în jos până ajungi pentru prima dată la pragul ales. Nu confunda procentul unei componente cu procentul cumulat. Nu forța criteriile să dea același număr.',rubric(('Aplici Kaiser și indici numărul corect.',1),('Precizezi pragul și primul număr care îl atinge; justifici alegerea.',1))),
      q(2,table(['Matricea factor','Dim1','Dim2'],[[codes[i],f(mf[i,0]),f(mf[i,1])] for i in range(p)]),interpretation+f' Ea explică {perc[1]:.2f}% din variația totală. O numesc „contrastul dintre '+ ' / '.join(names[i] for i in side(1,True))+(' și '+ ' / '.join(names[i] for i in side(1,False)) if neg else '')+'”. Denumirea este descriptivă; nu presupune că axa măsoară exclusiv un singur fenomen.', 'Te uiți doar la coloana a doua. Alegi coeficienții cei mai mari în valoare absolută, inclusiv pe cei negativi. Plus înseamnă variație în același sens cu axa, minus în sens opus. Numele componentei trebuie să reflecte indicatorii dominanți, chiar dacă rezultă un profil mixt.',rubric(('Identifici indicatorii dominanți și coeficienții lor pe PC2.',1),('Explici sensurile, propui un nume susținut și precizezi variația explicată.',1))),
      q(3,table(['Variabilă','Dim1','Dim2','ctr1 (%)','ctr2 (%)'],[[codes[i],f(mf[i,0]),f(mf[i,1]),f(ctr[i,0]),f(ctr[i,1])] for i in range(p)]),f'Dim1 și Dim2 sunt corelațiile indicatorilor cu componentele, cu valori între −1 și 1. De exemplu, {codes[v]} ({names[v]}) are r = {f(mf[v,0])} cu PC1 și r = {f(mf[v,1])} cu PC2. Semnul indică sensul, iar |r| intensitatea. ctr1 și ctr2 arată procentul cu care variabila participă la construirea fiecărei axe. {codes[v]} are ctr1 = {ctr[v,0]:.2f}%, iar {codes[w]} are ctr2 = {ctr[w,1]:.2f}%, peste reperul mediu de {threshold:.2f}% = 100/{p}. Contribuțiile se adună la 100% separat pe fiecare componentă, înainte de rotunjire.', 'Dim = cât de strâns și în ce sens se leagă variabila de axă. ctr = cât ajută variabila la construirea axei. O corelație negativă poate avea o contribuție mare: contribuția nu are semn. ctr NU este procentul din variabilă explicat de axă; pentru acesta folosești cos², adică aici pătratul corelației.',rubric(('Interpretezi numeric Dim1 și Dim2, cu semn și intensitate.',1),('Interpretezi contribuțiile pentru ambele axe, reperul mediu și diferența față de cos².',1))),
      q(4,region_rows,f'Graficul are PC1 pe orizontală și PC2 pe verticală; planul păstrează {cum[1]:.2f}% din variație. Concluzia 1: {labels[high]} este la extrema pozitivă a PC1 ({scores[high,0]:.3f}), iar {labels[low]} la extrema negativă ({scores[low,0]:.3f}); au profiluri opuse pe această axă. Capătul pozitiv este asociat mai ales cu {desc(0,True)}, iar cel negativ cu {desc(0,False) or "valori mai mici ale indicatorilor cu încărcări pozitive"}. Concluzia 2: {labels[up]} are scorul PC2 maxim ({scores[up,1]:.3f}), iar {labels[down]} minim ({scores[down,1]:.3f}); diferența se interpretează prin contrastul PC2 de la cerința 3. cos² în plan pentru aceste două regiuni este {quality[up]:.3f}, respectiv {quality[down]:.3f}; interpretarea este cu atât mai sigură cu cât cos² este mai mare. Nu afirm că două regiuni sunt identice în toate variabilele doar fiindcă par apropiate în acest plan.', 'Punct = regiune. Dreapta/stânga = scor pozitiv/negativ pe PC1. Sus/jos = scor pozitiv/negativ pe PC2. Tradu direcția prin indicatorii care definesc axa. Dă două concluzii despre regiuni numite concret. Apropierea sugerează profiluri asemănătoare în plan; verifică reprezentarea înainte de a generaliza.',rubric(('Reprezinți regiunile pe cele două axe etichetate și menționezi informația păstrată.',.5),('Formulezi prima concluzie concretă, legată de PC1.',.75),('Formulezi a doua concluzie concretă, legată de PC2; respecți limitele planului.',.75)))
    ]
    paper=dict(id=pid,number=t+1,title=theme,minutes=40,origin='Cerințe transcrise din fotografia profesorului; outputuri calculate pe datele proiectului (116 regiuni, 12 indicatori).' if t==0 else 'Variantă de antrenament creată după modelul profesorului. Date sintetice, fără semnificație statistică oficială.',n=n,p=p,variables=[dict(code=c,name=name) for c,name in zip(codes,names)],questions=questions,graph=f'/professor-exams/{pid}.svg',csv=f'/professor-exams/{pid}.csv',script=f'/professor-exams/{pid}.R',eigenvalues=ev.tolist(),correlation=R.tolist(),factor=mf[:,:2].tolist(),contributions=ctr[:,:2].tolist(),scores=scores[:,:2].tolist(),regions=labels)
    papers.append(paper)
    md=f'# Model {t+1:02d} — {theme}\n\n{paper["origin"]}\n\n40 minute · 9 puncte + 1 punct din oficiu. Barem orientativ de pregătire.\n\n'
    md+='\n'.join(f'- {c}: {name}' for c,name in zip(codes,names))+'\n\n'
    for question in questions:
        md+=f'## {question["number"]}. ({question["points"]}p) {question["prompt"]}\n\n```text\n{question["output"]}\n```\n\n**Răspuns-model:** {question["model"]}\n\n**Pe înțelesul tău:** {question["explanation"]}\n\n'
        md+='\n'.join(f'- {r["points"]}p: {r["label"]}' for r in question['rubric'])+'\n\n'
    md+=f'![Regiuni]({pid}.svg)\n'
    (OUT/f'{pid}-rezolvare.md').write_text(md)
(ROOT/'content/professor-exams.json').write_text(json.dumps(dict(papers=papers),ensure_ascii=False,indent=2))
# The original photograph is versioned alongside generated exercise assets.
assert (OUT/'model-profesor-original.png').exists(), 'Missing original test photograph'
print('Generated 10 papers, 50 questions, datasets, plots, R scripts and worked answers.')
