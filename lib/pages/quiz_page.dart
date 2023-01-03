import 'package:flutter/material.dart';

import 'package:ouizapp/utils/Question.dart';
import 'package:ouizapp/utils/Quiz.dart';
import 'package:ouizapp/UI/answer_button.dart';
import 'package:ouizapp/UI/question_text.dart';
import 'package:ouizapp/UI/correct_wrong_overlay.dart';
import 'package:ouizapp/pages/score_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  late Question currentQuestion;
  // ignore: unnecessary_new
  Quiz quiz = new Quiz([
    Question("İstede bir üniversitedir", true),
    Question("İnternet Güvenlidir", false),
     Question("iskenderun  İlçedir ", true),
     Question("Uzaylımısın?", true),
     Question(
"Barcelona İspanyanın Başkentidir",        false),
     Question("Türkiye Avrupa Birliği Ülkesidir", false),
     Question(
        "İstanbul 14 yüzyılda fethedilmiştri", false),
     Question(
        "Her doğal sayı tamsayıdır", true),
     Question("Afrika bir ülke değildir", true),
     Question(
        "Kanadanın başkenti torontodur",
        false),
     Question("Twitterda karakter sınırı 280 dir", true),
     Question(
        "Isı termometre ile ölçülür",
        false),
     Question("Çeyrek Altın 0.25gramdır", false),
     Question("Dinazorlar ile insanlar aynı anda yeryüzünde bulunmamıştır", false),
  ]);
  late String questionText;
  late int questionNumber;
  late bool isCorrect;
  bool overlayShouldVissible = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion!;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    setState(() {
      overlayShouldVissible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Column(
          //this is our main page
          children: <Widget>[
            AnswerButton(
                true,
                () => handleAnswer(
                    true)), //calling another page & handleAnswer for ans
            QuestionText(questionText, questionNumber),
             AnswerButton(false, () => handleAnswer(false)),
          ],
        ),
        overlayShouldVissible == true
            ?  CorrectWrongOverlay(isCorrect, () {
                if (quiz.lenght == questionNumber) {
                  Navigator.of(context).pushAndRemoveUntil(
                       MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ScorePage(quiz.score, quiz.lenght)),
                      // ignore: unnecessary_null_comparison
                      (Route route) => route == null);
                  return;
                }
                currentQuestion = quiz.nextQuestion!;
                setState(() {
                  overlayShouldVissible = false;
                  questionText = currentQuestion.question;
                  questionNumber = quiz.questionNumber;
                });
              })
            :  Container()
      ],
    );
  }
}