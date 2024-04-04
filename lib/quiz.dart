import 'package:flutter/material.dart';
import 'package:quizapp/answer_button.dart';
import 'package:quizapp/data/question.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var currentQuestionIndex = 0;

  void answerQuestion() {
    setState(() {
      currentQuestionIndex ++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final CurrentQuestion = questions[currentQuestionIndex];

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
                CurrentQuestion.text,
                style: const TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              ...CurrentQuestion.getShuffledAnswers().map((answers) {
                return  AnswerButton(answerText: answers, onTap: answerQuestion,);
              },),
            ],
          ),
        ),
      ),
    );
  }
}
