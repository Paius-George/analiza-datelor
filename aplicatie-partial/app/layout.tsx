import type { Metadata } from "next";
import "./globals.css";
export const metadata: Metadata = {
  robots: { index: false, follow: false },
  title: "Analiza Datelor · Laboratorul de parțial",
  description: "Înțelege outputurile R. Lecții 80/20, exemple explicate și simulări de parțial cu barem.",
  icons: { icon: "/favicon.svg" },
};
export default function RootLayout({ children }: Readonly<{ children: React.ReactNode }>) {
  return <html lang="ro"><body>{children}</body></html>;
}
