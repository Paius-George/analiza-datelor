"use client";
import { useEffect, useState } from "react";
const KEY = "fisele-8020-display-density-v1";
const SCALE_KEY = "fisele-8020-display-scale-v1";
const scales = [70, 80, 90, 100] as const;
type Density = "compact" | "comfortable";
export default function DisplayDensity(){
  const [density,setDensity]=useState<Density>("compact");
  const [scale,setScale]=useState(100);
  useEffect(()=>{
    try {
      const saved=localStorage.getItem(KEY);
      if(saved==="compact"||saved==="comfortable"){setDensity(saved);document.documentElement.dataset.density=saved;}
      const savedScale=Number(localStorage.getItem(SCALE_KEY));
      if(scales.some(v=>v===savedScale)){setScale(savedScale);document.documentElement.style.setProperty("--ui-scale",String(savedScale/100));}
    } catch { /* Preferintele raman utilizabile pentru pagina curenta. */ }
  },[]);
  function update(value:Density){setDensity(value);document.documentElement.dataset.density=value;try{localStorage.setItem(KEY,value);}catch{/* Nu blocheaza invatarea. */}}
  function updateScale(value:number){if(!scales.some(v=>v===value))return;setScale(value);document.documentElement.style.setProperty("--ui-scale",String(value/100));try{localStorage.setItem(SCALE_KEY,String(value));}catch{/* Nu blocheaza invatarea. */}}
  return <div className="display-options"><label className="display-density density-choice"><span>Aspect</span><select aria-label="Densitatea interfeței" value={density} onChange={e=>update(e.target.value as Density)}><option value="compact">Compact</option><option value="comfortable">Aerisit</option></select></label><label className="display-density"><span>Scală</span><select aria-label="Scala interfeței" value={scale} onChange={e=>updateScale(Number(e.target.value))}>{scales.map(v=><option key={v} value={v}>{v}%</option>)}</select></label></div>;
}
