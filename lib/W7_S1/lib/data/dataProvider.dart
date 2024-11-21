import "package:fluttermain/W7_S1/lib/model/quiz.dart";


Quiz game1 = Quiz(
  title: "Game 1",
  questions: questionList,
);

List<Question> questionList = [
  Question(
    title: "Who is the best teacher?",
    possibleAnswers: ["Ronan", "Hongly", "Mengly"],
    goodAnswer: "Ronan",
  ),
  Question(
    title: "What is the capital city of Cambodia?",
    possibleAnswers: ["Siem Reap", "Phnom Penh", "Battambang"],
    goodAnswer: "Phnom Penh",
  ),
  Question(
    title: "What is 2 + 2?",
    possibleAnswers: ["3", "4", "5"],
    goodAnswer: "4",
  ),
  Question(
    title: "Which planet is known as the Red Planet?",
    possibleAnswers: ["Earth", "Mars", "Venus"],
    goodAnswer: "Mars",
  ),
  Question(
    title: "What is the chemical symbol for water?",
    possibleAnswers: ["O2", "H2O", "CO2"],
    goodAnswer: "H2O",
  ),
  Question(
    title: "Who wrote 'Romeo and Juliet'?",
    possibleAnswers: ["Charles Dickens", "William Shakespeare", "Mark Twain"],
    goodAnswer: "William Shakespeare",
  ),
];