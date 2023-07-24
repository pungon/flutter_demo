import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
            opacity: 0.7,
            child: Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 237, 223, 252),
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton.icon(
            onPressed: startQuiz,
            style: ElevatedButton.styleFrom(
              //padding: const EdgeInsets.only(top:20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Colors.white, width: 1),
              ),
              padding: const EdgeInsets.only(top: 5, right: 20, bottom: 5),
              backgroundColor: const Color.fromARGB(255, 255, 171, 44),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 20),
            ),
            label: const Text('Start Quiz'),
            icon: const Icon(
              Icons.arrow_right,
              size: 40,
            ),
          )
        ],
      ),
    );
    ;
  }
}
