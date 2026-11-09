"""Importa integral fisele, fara sa execute scripturi R sau sa schimbe sursa."""
from pathlib import Path
import hashlib,json,re,shutil
import markdown
from bs4 import BeautifulSoup
root=Path(__file__).resolve().parents[1]
source=root.parent/'Pregatire 80-20'
meta=[('start','Începe de la zero','Limbajul outputurilor','Un punct de pornire clar, chiar dacă termenii par complicați.','compass'),('descriptive','Descriptive și corelații','Citește datele','Medii, distribuții și relațiile dintre indicatori.','table'),('acp','ACP, pe înțelesul tău','Înțelege componentele','Summary, valori proprii, scoruri și matricea factor.','layers'),('pca','Variabile și regiuni','Separă conceptele','Dim, cos² și contribuții, cu exemple citite pas cu pas.','target'),('grafice','Grafice, fără mister','Vezi ce spun datele','Cercuri, biploturi și regiuni în planurile principale.','chart'),('recap','Recapitulare rapidă','Fixează ideile','Reperele pe care le repeți înainte de parțial.','bookmark')]
meta += [('corespondente','Seminarul 7 · Corespondențe','Materia nouă','Tabele de contingență, inerție, categorii și interpretarea outputului ca().','chart'),('test-scris','Testul scris de mână','Exersează pe hârtie','Simulări ACP și analiza corespondențelor, cu răspunsuri-model și barem de antrenament.','bookmark')]
paths=sorted(source.glob('0*.md')) + sorted((root.parent/'Pregatire Test Vineri').glob('0*.md')); assert len(paths)==len(meta)
filemap={p.name:meta[i][0] for i,p in enumerate(paths)}
modules=[];lessons=[]
for i,path in enumerate(paths):
 text=path.read_text(); shutil.copy2(path,root/'public/materiale'/path.name)
 chunks=re.split(r'^## ',text,flags=re.M)
 title=chunks[0].splitlines()[0].lstrip('# ')
 intro='\n'.join(chunks[0].splitlines()[1:]).strip()
 sections=[(title,intro)]+[(c.split('\n',1)[0],c.split('\n',1)[1] if '\n' in c else '') for c in chunks[1:]]
 lessonids=[]
 for j,(heading,body) in enumerate(sections):
  if not body.strip():continue
  if meta[i][0]=='corespondente' and j==0: body += '\n\n[Descarcă PDF-ul original — Seminarul 7](/materiale/Seminar%207.pdf)\n'
  html=markdown.markdown(body,extensions=['tables','fenced_code','sane_lists'])
  soup=BeautifulSoup(html,'html.parser')
  for img in soup.find_all('img'):
   image=Path(img['src']).name
   assert (path.parent/'imagini'/image).is_file()
   shutil.copy2(path.parent/'imagini'/image,root/'public/theory/images'/image)
   img['src']='/theory/images/'+image;img['loading']='lazy';img['decoding']='async';img['tabindex']='0';img['role']='button';img['aria-label']='Mărește graficul: '+img.get('alt','Grafic')
  for a in soup.find_all('a'):
   if a.get('href') in filemap:a['href']='#modul/'+filemap[a['href']]
  for para in soup.find_all('p'):
   if para.get_text().startswith(('La test','Spui:','1 — model:','2 — model:','3 — model:','4 — model:')):para['class']=['model-answer']
   if para.get_text().startswith(('Reține:','Nu confunda:')):para['class']=['remember']
  for t in soup.find_all('table'):
   wrap=soup.new_tag('div',attrs={'class':'table-scroll'});t.wrap(wrap)
  lid=f'{meta[i][0]}-{j}'
  cleaned=re.sub(r'^\d+[.]\s*','',heading)
  lessons.append({'id':lid,'module':meta[i][0],'title':cleaned,'html':str(soup),'text':soup.get_text(' ',strip=True),'minutes':max(1,round(len(body.split())/170))})
  lessonids.append(lid)
 modules.append({'id':meta[i][0],'title':meta[i][1],'eyebrow':meta[i][2],'description':meta[i][3],'icon':meta[i][4],'lessons':lessonids,'file':path.name,'sha256':hashlib.sha256(path.read_bytes()).hexdigest()})
audit=source/'VERIFICARE_ACOPERIRE.md'
shutil.copy2(audit,root/'public/materiale'/audit.name)
(root/'content/theory.json').write_text(json.dumps({'modules':modules,'lessons':lessons},ensure_ascii=False,indent=2))
assert len(lessons)>=50
print(f'{len(modules)} module, {len(lessons)} lecții; text integral și toate imaginile importate.')
