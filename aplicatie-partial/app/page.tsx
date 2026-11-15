import SubjectHome from "../components/SubjectHome";
import theory from "../content/theory.json";
import cse from "../content/cse.json";
export default function Page() { return <SubjectHome adLessons={theory.lessons.length} cseLessons={cse.lessons.length} cseQuestions={cse.questions.length} cseExams={cse.exams.length}/>; }
