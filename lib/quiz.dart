import 'package:flutter/material.dart';
import 'package:quizapp/answer_button.dart';
import 'package:quizapp/data/question.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quizapp/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var currentQuestionIndex = 0;
  List<String> selectedAnswers = [];

  void answerQuestion(String answer) {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        selectedAnswers.add(answer);
        currentQuestionIndex++;
      } else {
        // If all questions have been answered, navigate to the result screen
        selectedAnswers.add(answer);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ResultScreen(chosenAnswers : selectedAnswers)),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 108, 47, 221),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestion.text,
                style: GoogleFonts.tiltNeon(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              ...currentQuestion.getShuffledAnswers().map((answer) {
                return AnswerButton(answerText: answer, onTap: () => answerQuestion(answer));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
