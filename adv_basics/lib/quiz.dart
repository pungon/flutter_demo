import 'package:flutter/material.dart';
import 'package:adv_basics/Start_Screen.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'Start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'restart-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        //selectedAnswers = [];
        activeScreen = 'results-screen';
      });
    }
  }



// class _QuizState extends State<Quiz> {
//   Widget? activeScreen;

//   @override
//   void initState() {
//     activeScreen = StartScreen(switchScreen);
//     super.initState();
//   }

//   void switchScreen() {
//     setState(() {
//       activeScreen = const QuestionsScreen();
//     });
//   }

  @override
  Widget build(BuildContext context) {
    // final screenwidget = activeScreen == 'Start-screen'
    //     ? StartScreen(switchScreen)
    //     : const QuestionsScreen();

    Widget screenwidget = StartScreen(switchScreen);
    //Widget screenwidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenwidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    
    if (activeScreen == 'results-screen') {
      screenwidget = ResultsSreen(
        chosenAnswers: selectedAnswers,
        restartQuiz: restartQuiz,
      );
    }

  
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 15, 168),
            ]),
          ),
          //child: Center(
          //child: activeScreen,
          child: screenwidget,

          //  child: activeScreen == 'Start-screen'
          // ? StartScreen(switchScreen)
          // : const QuestionsScreen(),

          //),
        ),
      ),
    );
  }
}
