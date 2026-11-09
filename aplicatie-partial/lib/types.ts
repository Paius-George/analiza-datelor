export interface Question { id: string; kind: 'mcq' | 'numeric' | 'written'; category: string; title: string; prompt: string; choices?: string[]; correct?: number; explanation?: string; model?: string; rubric?: string[]; output?: string | null; image?: string | null; tolerance?: number; }
export interface Exam { id: string; number: number; title: string; description: string; minutes: number; level: string; questions: string[]; }
export interface Attempt { correct: number; total: number; lastCorrect: boolean; }
export interface Session { id: string; variant: string; deadline: number; started: number; answers: Record<string, string | number>; flagged: string[]; index: number; }
export interface Result extends Session { submitted: number; selfScores: Record<string, number>; }
export interface Progress { completed: string[]; attempts: Record<string, Attempt>; history: Result[]; active: Session | null; lastLesson: string | null; flashKnown: string[]; }
export interface Route { view: string; id?: string; }
