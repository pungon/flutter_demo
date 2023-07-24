import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/models/question_summary.dart';

class ResultsSreen extends StatelessWidget {
  const ResultsSreen(
      {super.key, required this.chosenAnswers, required this.restartQuiz});

  final List<String> chosenAnswers;
  final VoidCallback restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> Summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      // loop body
      Summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }

    return Summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              QuestionsSummary(getSummaryData()),
              const SizedBox(
                height: 30,
              ),
              OutlinedButton.icon(
                onPressed: restartQuiz,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.white, width: 1),
                  ),
                  padding: const EdgeInsets.only(top: 5, right: 20, bottom: 5),
                  // backgroundColor: const Color.fromARGB(255, 255, 171, 44),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                label: const Text('Restart Quiz!'),
                icon: const Icon(
                  Icons.refresh,
                  size: 20,
                ),
                
                

              )
            ]),
      ),
    );
  }
}
