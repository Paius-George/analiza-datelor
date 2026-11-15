"use client";
import { useEffect, useState } from "react";
const KEY = "fisele-8020-display-density-v1";
type Density = "compact" | "comfortable";
export default function DisplayDensity(){
  const [density,setDensity]=useState<Density>("compact");
  useEffect(()=>{
    try { const saved=localStorage.getItem(KEY);if(saved==="compact"||saved==="comfortable"){setDensity(saved);document.documentElement.dataset.density=saved;} }
    catch { /* Preferinta ramane utilizabila pentru pagina curenta. */ }
  },[]);
  function update(value:Density){setDensity(value);document.documentElement.dataset.density=value;try{localStorage.setItem(KEY,value);}catch{/* Nu blocheaza invatarea. */}}
  return <label className="display-density"><span>Aspect</span><select aria-label="Densitatea interfeței" value={density} onChange={e=>update(e.target.value as Density)}><option value="compact">Compact</option><option value="comfortable">Aerisit</option></select></label>;
}
