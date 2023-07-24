import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:adv_basics/models/answer_button.dart';
import 'package:adv_basics/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreen();
  }
}

void myFunction() {
  // โค้ดที่ต้องการให้ฟังก์ชันนี้ทำงาน
}

class _QuestionsScreen extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex += 1;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment
              .stretch, //ขยายตามความกว้างของ parent widget หรือเต็มพื้นที่ที่มีอยู่ในแนวนอนโดยไม่คำนึงถึงขนาดและตำแหน่งของ children

          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),

            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                anstext: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              );
            })

            // AnswerButton(anstext: currentQuestion.answers[0], onTap: myFunction),
            // AnswerButton(anstext: currentQuestion.answers[1], onTap: myFunction),
            // AnswerButton(anstext: currentQuestion.answers[2], onTap: myFunction),
            // AnswerButton(anstext: currentQuestion.answers[3], onTap: myFunction),
          ],
        ),
      ),
    );
  }
}
