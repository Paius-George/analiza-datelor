"""Append-only bank for the supplied professor code. Computes exercises in Python; never runs R."""
from pathlib import Path
import csv,json
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
ROOT=Path(__file__).resolve().parents[1];OUT=ROOT/'public/professor-exams'
BASE=json.loads((ROOT/'content/professor-exams.json').read_text())['papers']
NAMES=[v['name'] for v in BASE[0]['variables']]
COMMANDS='''#import date
cor(scale(X,center=T,scale=T))
acp <- princomp(X,cor=T,scores=TRUE)
summary(acp)
plot(acp,type="l")
scoruri <- acp$scores
MF=cor(X,scoruri)
library(corrplot)
corrplot(MF,method="number")
library(factoextra)
library(FactoMineR)
acp2 <- PCA(X,scale.unit=T,graph=T)
acp2
summary(acp2)
fviz_pca_ind(acp2)
'''
(OUT/'cod-profesor.R').write_text('# Transcriere din documentul furnizat: Cod test ACP.docx\n# X trebuie să conțină doar indicatori numerici; codurile regiunilor sunt nume de rând.\n'+COMMANDS)
def table(headers,rows):
 widths=[max(len(str(h)),*(len(str(r[i])) for r in rows)) for i,h in enumerate(headers)]
 return '\n'.join('  '.join(str(v).ljust(w) for v,w in zip(row,widths)).rstrip() for row in [headers]+rows)
def f(v):return f'{v:.3f}'
def groups(mf,j,names):
 out=[]
 for sign in [1,-1]:
  ids=sorted([i for i in range(len(names)) if mf[i,j]*sign>=.3],key=lambda i:abs(mf[i,j]),reverse=True)[:3]
  out.append(', '.join(f'{names[i]} (X{i+1}: {mf[i,j]:.3f})' for i in ids))
 return out
TITLES=['Citește summary(acp)','Kaiser versus variația cumulată','Dă un nume componentei 2','Corelație negativă, contribuție mare','Cinci axe calculate nu înseamnă cinci păstrate','Primele 10 variabile nu sunt toate','Aceeași axă, semne diferite','Regiuni: scor, ctr și cos2','Cât de utilă este reducerea dimensionalității?','Simulare completă cu codul profesorului']
TIPS=[
'În summary(acp), Standard deviation nu este valoarea proprie: λ = sdev². Proportion of Variance este proporție, nu procent deja înmulțit cu 100.',
'Precizează pragul ales pentru variația cumulată. Kaiser și pragul de 80% pot conduce la numere diferite de componente.',
'MF = cor(X, scoruri) conține corelații, nu simplii vectori proprii din acp$loadings. Interpretează coloana Comp.2.',
'Un r negativ mare în modul poate avea ctr mare. Contribuția nu este negativă; semnul aparține coordonatei.',
'PCA() calculează implicit până la 5 axe de coordonate. Acest ncp tehnic nu este numărul de axe ales prin Kaiser; tabelul valorilor proprii poate avea mai multe axe.',
'summary(acp2) afișează implicit primele 10 elemente și 3 axe în secțiunile de coordonate. Primele 10 nu înseamnă cele mai importante; reperul contribuției este 100/p pentru toate variabilele active.',
'princomp și PCA pot orienta diferit aceeași axă. Compară semnele matricei factor cu coordonatele PCA înainte să numești sus/jos în grafic.',
'În Variables, Dim este o corelație. În Individuals, Dim este un scor de regiune, care poate depăși 1; ctr nu este cos2.',
'ACP poate fi calculată și când corelațiile sunt slabe. Dacă ai nevoie de multe componente pentru 80%, sinteza este mai puțin eficientă.',
'Încheie fiecare răspuns cu o concluzie și citează valori. Separă ce descriu variabilele de ce descriu regiunile.'
]
papers=[]
plt.rcParams['svg.hashsalt']='professor-code-exams-v1'
for t in range(10):
 number=t+11;pid=f'model-{number:02d}';p=[6,8,10,8,12,12,10,8,8,12][t];n=64+4*t
 rng=np.random.default_rng(511100+t);latent=rng.normal(size=(n,3))
 if t==8:
  raw=rng.normal(size=(n,p))+.2*latent[:,[0]]
 else:
  W=np.array([[.9,.1,.15],[.8,.25,.05],[.8,-.4,.05],[.85,-.3,.1],[.75,.4,.25],[.65,-.55,.1],[-.75,.5,.05],[-.7,.6,.1],[.6,.65,.25],[.65,.15,-.55],[-.7,.2,.35],[.2,.6,.8]])[:p]
  raw=latent@W.T+rng.normal(size=(n,p))*(.25+.1*(t%3))
 X=15+70*(raw-raw.min(axis=0))/(raw.max(axis=0)-raw.min(axis=0))
 # A deliberate negative association in model 17 makes the orientation difference visible.
 if t==6:X[:,0]=100-X[:,0]
 labels=[f'T{number:02d}R{i+1:03d}' for i in range(n)];codes=[f'X{i+1}' for i in range(p)];names=NAMES[:p]
 Z=(X-X.mean(axis=0))/X.std(axis=0,ddof=0);R=Z.T@Z/n
 ev,V=np.linalg.eigh(R);ev=ev[::-1];V=V[:,::-1]
 Vprin=V*np.where(V[0]>=0,1,-1)
 Vpca=V*np.where(V.sum(axis=0)>=0,1,-1)
 mf=Vpca*np.sqrt(ev);mfprin=Vprin*np.sqrt(ev);score=Z@Vpca
 axisSigns=np.sign((Vpca*Vprin).sum(axis=0)).astype(int)
 ctr=100*Vpca**2;varcos=mf**2;percent=100*ev/p;cum=percent.cumsum();k=int(sum(ev>1));k80=int(np.searchsorted(cum,80)+1)
 distance=(Z**2).sum(axis=1);cos=score**2/distance[:,None];indctr=100*score**2/(n*ev)
 top_pairs=sorted([(abs(R[i,j]),i,j) for i in range(p) for j in range(i+1,p)],reverse=True)
 _,a,b=top_pairs[0];_,c,d=top_pairs[1]
 strong=sum(v>=.5 for v,_,_ in top_pairs)
 q=[]
 def add(i,command,output,model,explanation,images=None):
  q.append(dict(number=i+1,points=BASE[0]['questions'][i]['points'],prompt=BASE[0]['questions'][i]['prompt'],command=command,output=output,model=model,explanation=explanation,rubric=BASE[0]['questions'][i]['rubric'],images=images or []))
 conclusion=('Corelațiile indică informație comună și justifică explorarea prin ACP.' if strong else 'Corelațiile sunt în general slabe în acest exemplu; ACP este calculabilă, dar avantajul reducerii dimensionalității este limitat, nu îl afirm automat.')
 add(0,COMMANDS.splitlines()[1],table(['']+codes,[[codes[i]]+[f(v) for v in R[i]] for i in range(p)]),f'{codes[a]}–{codes[b]} au r = {R[a,b]:.3f}, iar {codes[c]}–{codes[d]} au r = {R[c,d]:.3f}. Sunt {strong} perechi cu |r| ≥ 0,50 din {len(top_pairs)}. {conclusion} Semnul arată sensul asocierii, nu cauzalitatea.', 'cor(scale(X)) este matricea de corelație a indicatorilor. Standardizarea nu schimbă corelațiile Pearson între coloane. Ignor diagonala de 1, discut semnul și modulul a două valori și abia apoi justific utilitatea ACP. Nu spun că ACP este interzisă când corelațiile sunt mici.')
 summary=table(['']+[f'Comp.{i+1}' for i in range(p)],[['Standard deviation']+[f(v) for v in np.sqrt(ev)],['Proportion of Variance']+[f'{v/p:.5f}' for v in ev],['Cumulative Proportion']+[f'{v/100:.5f}' for v in cum]])
 eigtable=table(['Eigenvalues']+[f'Dim.{i+1}' for i in range(p)],[['Variance']+[f(v) for v in ev],['% of var.']+[f(v) for v in percent],['Cumulative % of var.']+[f(v) for v in cum]])
 scree=f'/professor-exams/{pid}-scree.svg'
 fig,ax=plt.subplots(figsize=(8,4.5));ax.plot(range(1,min(p,10)+1),ev[:10],marker='o',color='#6b5ce0');ax.set(xlabel='Componentă',ylabel='Valoare proprie',title=f'Model {number} • plot(acp, type="l")');ax.set_xticks(range(1,min(p,10)+1));ax.grid(alpha=.15);fig.tight_layout();fig.savefig(OUT/f'{pid}-scree.svg',metadata={'Date':None});plt.close(fig)
 add(1,'summary(acp)\nplot(acp,type="l")\nsummary(acp2)  # secțiunea Eigenvalues',summary+'\n\n'+eigtable,f'Ridic la pătrat Standard deviation: pentru PC1, {np.sqrt(ev[0]):.3f}² ≈ {ev[0]:.3f}; valorile nerotunjite dau rezultatul exact. Kaiser păstrează {k} componente cu λ > 1, echivalent sdev > 1 în această ACP standardizată. Acestea explică {cum[k-1]:.2f}%. La un prag ales de 80%, primul număr suficient este {k80}, cu {cum[k80-1]:.2f}%. '+('Criteriile coincid.' if k==k80 else f'Dacă vreau minimum 80% din informație, aleg {k80}; aplicând strict Kaiser, aleg {k}.')+f' Proportion of Variance pentru PC1 este {ev[0]/p:.5f}, adică {percent[0]:.2f}%.', 'Citește trei lucruri separat: Standard deviation = abaterea componentei; pătratul ei = valoarea proprie; Proportion/Cumulative sunt proporții și se înmulțesc cu 100 pentru procente. Scree plot arată valorile proprii; cotul este un reper grafic, nu un număr impus fără justificare. Graficul plot(acp) afișează implicit cel mult primele 10 axe; tabelul este complet. ncp=5 implicit din PCA() nu înlocuiește criteriile de selecție.',[dict(src=scree,alt='Scree plot al valorilor proprii')])
 pos,neg=groups(mfprin,1,names)
 interpretation=(f'Pe Comp.2 sunt asocieri pozitive mai importante pentru {pos or "niciun indicator cu |r| ≥ 0,30"} și negative pentru {neg or "niciun indicator cu |r| ≥ 0,30"}. ')
 label=('contrast între '+ ' / '.join(names[i] for i in np.argsort(-abs(mfprin[:,1]))[:3]))
 mfimage=f'/professor-exams/{pid}-factor.svg'
 fig,ax=plt.subplots(figsize=(max(7,p*.65),max(4,p*.45)));ax.imshow(mfprin,cmap='RdBu_r',vmin=-1,vmax=1)
 for i in range(p):
  for j in range(p):ax.text(j,i,f'{mfprin[i,j]:.2f}',ha='center',va='center',fontsize=8,color='white' if abs(mfprin[i,j])>.65 else '#24243b')
 ax.set_xticks(range(p),[f'Comp.{i+1}' for i in range(p)],rotation=45,ha='right');ax.set_yticks(range(p),codes);ax.set_title(f'Model {number} • MF = cor(X, scoruri)');fig.tight_layout();fig.savefig(OUT/f'{pid}-factor.svg',metadata={'Date':None});plt.close(fig)
 add(2,'scoruri <- acp$scores\nMF=cor(X,scoruri)\ncorrplot(MF,method="number")',table(['MF']+[f'Comp.{i+1}' for i in range(p)],[[codes[i]]+[f(v) for v in mfprin[i]] for i in range(p)]),interpretation+f'Componenta explică {percent[1]:.2f}% din variația totală. O denumire descriptivă posibilă este „{label}”, cu sensurile precizate mai sus. '+('Are putere de sinteză modestă: nu exagerez interpretarea unor corelații slabe.' if max(abs(mfprin[:,1]))<.6 else '')+ ' Numele descrie asocieri din setul de date; nu demonstrează cauzalitate.', 'Aici matricea factor chiar este cor(X, scoruri), deci numerele sunt corelații. Nu o confunda cu acp$loadings, unde sunt vectorii proprii. Citesc doar Comp.2, aleg coeficienții mari în modul, verific și minusurile și construiesc numele pe indicatorii dominanți. Pentru sensul regiunilor din fviz_pca_ind folosesc coordonatele PCA de la cerința 4: între metode semnul unei axe poate fi inversat.',[dict(src=mfimage,alt='Matricea factor cu valori numerice')])
 rows=[]
 for i in range(min(p,10)):
  rows.append([codes[i]]+[f(v) for j in range(3) for v in [mf[i,j],ctr[i,j],varcos[i,j]]])
 v=int(np.argmax(ctr[:min(p,10),0]));w=int(np.argmax(ctr[:min(p,10),1]))
 flips=', '.join(f'PC{j+1}' for j in range(2) if axisSigns[j]<0)
 signnote=f' În acest exemplu {flips} are semn invers față de MF din princomp; sensul se inversează împreună cu axa, contribuțiile și cos² rămân aceleași.' if flips else ' Primele două axe au aceeași orientare în cele două outputuri din această variantă.'
 add(3,'acp2 <- PCA(X,scale.unit=T,graph=T)\nsummary(acp2)  # secțiunea Variables',('Variables'+(' (the 10 first)' if p>10 else '')+'\n'+table(['']+['Dim.1','ctr','cos2','Dim.2','ctr','cos2','Dim.3','ctr','cos2'],rows)),f'În Variables, Dim.1 și Dim.2 sunt corelații. Pentru {codes[v]}, r cu PC1 este {mf[v,0]:.3f}, iar cu PC2 este {mf[v,1]:.3f}; semnul indică sensul, modulul intensitatea. ctr este contribuția la construirea axei: {codes[v]} are {ctr[v,0]:.2f}% pe PC1 și {codes[w]} are {ctr[w,1]:.2f}% pe PC2. Reperul mediu este 100/{p} = {100/p:.2f}%, calculat cu toate cele {p} variabile active. cos² pentru {codes[v]} pe PC1 este {varcos[v,0]:.3f}, adică {100*varcos[v,0]:.2f}% din variația sa reprezentată de această axă; în această ACP standardizată cos² = r². '+('Tabelul arată doar primele 10 variabile, deci contribuțiile rândurilor vizibile nu trebuie să însumeze 100%.' if p>10 else 'Contribuțiile tuturor variabilelor însumează 100% separat pe fiecare axă, înainte de rotunjire.')+signnote, 'În fiecare grup de trei coloane citești: Dim = corelație, ctr = procent din construirea componentei, cos2 = cât de bine se vede variabila pe acea axă. Următorul grup este pentru componenta următoare. Nu aduni ctr de pe PC1 cu ctr de pe PC2 și nu tratezi ctr ca procent de reprezentare. Summary afișează implicit doar 10 elemente și 3 axe, deși analiza poate conține mai multe.')
 extremes=list(dict.fromkeys([int(np.argmax(score[:,0])),int(np.argmin(score[:,0])),int(np.argmax(score[:,1])),int(np.argmin(score[:,1]))]))
 hi,lo=int(np.argmax(score[:,0])),int(np.argmin(score[:,0]));up,down=int(np.argmax(score[:,1])),int(np.argmin(score[:,1]))
 indrows=[[labels[i],f(np.sqrt(distance[i]))]+[f(v) for j in range(2) for v in [score[i,j],indctr[i,j],cos[i,j]]] for i in extremes]
 graph=f'/professor-exams/{pid}.svg';fig,ax=plt.subplots(figsize=(10,7));ax.scatter(score[:,0],score[:,1],c='#6b5ce0',s=23,alpha=.65)
 for i in range(n):ax.annotate(labels[i],score[i,:2],xytext=(3,3),textcoords='offset points',fontsize=6)
 ax.axhline(0,c='grey',lw=.7);ax.axvline(0,c='grey',lw=.7);ax.set(xlabel=f'Componenta 1 ({percent[0]:.2f}%)',ylabel=f'Componenta 2 ({percent[1]:.2f}%)',title=f'Model {number} • Regiuni în planul PCA');ax.grid(alpha=.12);fig.tight_layout();fig.savefig(OUT/f'{pid}.svg',metadata={'Date':None});plt.close(fig)
 p1,n1=groups(mf,0,names);p2,n2=groups(mf,1,names)
 add(4,'fviz_pca_ind(acp2)\n# Tabelul de mai jos selectează extremele din acp2$ind; nu este lista implicită a primelor 10.', 'Individuals — selecție pentru verificarea concluziilor\n'+table(['','Dist','Dim.1','ctr','cos2','Dim.2','ctr','cos2'],indrows),f'Graficul regiunilor folosește coordonatele din PCA, cu PC1 orizontală și PC2 verticală, și păstrează {cum[1]:.2f}% din variație. Concluzia 1: {labels[hi]} (PC1={score[hi,0]:.3f}) și {labels[lo]} (PC1={score[lo,0]:.3f}) au profiluri opuse pe PC1. Sensul pozitiv este asociat cu {p1 or "coeficienții pozitivi din tabel"}, iar cel negativ cu {n1 or "valori mici ale indicatorilor corelați pozitiv"}. Concluzia 2: {labels[up]} (PC2={score[up,1]:.3f}) și {labels[down]} (PC2={score[down,1]:.3f}) contrastează pe PC2, al cărei sens pozitiv este asociat cu {p2 or "coeficienții pozitivi din tabel"}, iar cel negativ cu {n2 or "valori mici ale indicatorilor corelați pozitiv"}. cos² în plan pentru aceste ultime două regiuni este {cos[up,:2].sum():.3f}, respectiv {cos[down,:2].sum():.3f}; țin cont de calitatea reprezentării. '+('Planul pierde multă informație în acest exemplu; concluziile rămân limitate la cele două axe.' if cum[1]<60 else ''), 'În Individuals, Dim este scorul unei regiuni, nu corelația unei variabile. Poate depăși ±1. ctr arată participarea regiunii la axă; cos² arată calitatea reprezentării, iar cos² pe plan = cos² pe PC1 + cos² pe PC2. Folosesc indicatorii din PCA pentru a numi direcțiile graficului. Două puncte apropiate sugerează profiluri asemănătoare în plan, fără a demonstra identitate în toate variabilele.')
 with (OUT/f'{pid}.csv').open('w') as stream:
  writer=csv.writer(stream,lineterminator='\n');writer.writerow(['regiune']+codes);writer.writerows([[name]+list(row) for name,row in zip(labels,X)])
 script=f'''# Model {number}: date sintetice de antrenament; rulează manual dacă dorești.
# Salvează CSV-ul lângă script și setează acel folder ca director de lucru.
# Pachete necesare: corrplot, factoextra, FactoMineR. Instalare manuală, o singură dată:
# install.packages(c("corrplot", "factoextra", "FactoMineR"))
X <- read.csv("{pid}.csv", row.names=1, check.names=FALSE)
stopifnot(all(vapply(X, is.numeric, logical(1))), !anyNA(X))
# Comenzile profesorului, transcrise fără schimbarea algoritmilor:
{COMMANDS}
# Opțional, ca să vezi toate variabilele pentru primele două axe:
# summary(acp2, nbelements=ncol(X), ncp=2)
# Semnele axelor pot diferi între princomp și PCA. Nu compara sensurile fără verificare.
'''
 (OUT/f'{pid}.R').write_text(script)
 paper=dict(id=pid,number=number,title=TITLES[t],minutes=40,origin='Variantă nouă după cerințele din fotografie și comenzile din „Cod test ACP.docx”. Date sintetice; outputuri didactice calculate în Python după definițiile funcțiilor, fără rulare R.',n=n,p=p,variables=[dict(code=c,name=name) for c,name in zip(codes,names)],questions=q,graph=graph,csv=f'/professor-exams/{pid}.csv',script=f'/professor-exams/{pid}.R',eigenvalues=ev.tolist(),correlation=R.tolist(),factor=mf[:,:2].tolist(),factorPrincomp=mfprin[:,:2].tolist(),contributions=ctr[:,:2].tolist(),scores=score[:,:2].tolist(),regions=labels,scoreDivisor='n',axisSigns=axisSigns[:2].tolist(),variableCos2=varcos[:,:2].tolist(),individualCos2=cos[:,:2].tolist(),individualContributions=indctr[:,:2].tolist(),source='professor-code',tip=TIPS[t])
 papers.append(paper)
 md=f'# Model {number} — {paper["title"]}\n\n{paper["origin"]}\n\n40 minute · 9p + 1p din oficiu. Barem orientativ.\n\n**Capcana de urmărit:** {TIPS[t]}\n\n'
 md+='\n'.join(f'- X{i+1}: {names[i]}' for i in range(p))+'\n\n'
 for question in q:
  md+=f'## {question["number"]}. ({question["points"]}p) {question["prompt"]}\n\n```r\n{question["command"]}\n```\n\n```text\n{question["output"]}\n```\n\n**Pe înțelesul tău:** {question["explanation"]}\n\n**Răspuns-model:** {question["model"]}\n\n'
  md+='\n'.join(f'- {r["points"]}p: {r["label"]}' for r in question['rubric'])+'\n\n'
  for im in question['images']:md+=f'![{im["alt"]}]({Path(im["src"]).name})\n\n'
 md+=f'![Regiuni]({pid}.svg)\n\nSurse tehnice: [R princomp](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/princomp.html), [summary.PCA](https://github.com/cran/FactoMineR/blob/master/R/summary.PCA.r), [svd.triplet](https://github.com/cran/FactoMineR/blob/master/R/svd.triplet.R).\n'
 (OUT/f'{pid}-rezolvare.md').write_text(md)
(ROOT/'content/code-exams.json').write_text(json.dumps({'commands':COMMANDS,'papers':papers},ensure_ascii=False,indent=2))
print('Added 10 code-based papers (11–20), 50 questions, 30 plots and 10 manual R scripts; old bank unchanged.')
