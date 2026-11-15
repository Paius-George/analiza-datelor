import type { Metadata } from "next";
import "./globals.css";
import "./subjects.css";
export const metadata: Metadata = {
  robots: { index: false, follow: false },
  title: "Fișele 80/20 · Alege materia",
  description: "Analiza Datelor și Cibernetica sistemelor economice: lecții 80/20, exemple, exerciții și simulări cu barem.",
  icons: { icon: "/favicon.svg" },
};
export default function RootLayout({ children }: Readonly<{ children: React.ReactNode }>) {
  return <html lang="ro" data-density="compact"><body>{children}</body></html>;
}
