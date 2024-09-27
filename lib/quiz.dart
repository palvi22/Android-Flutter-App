import 'package:flutter/material.dart';
import 'package:project2udemy/question_screen.dart';
import 'package:project2udemy/start_screen.dart';
import 'package:project2udemy/data/questions.dart';
import 'package:project2udemy/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
//   var activeScreen = 'start-screen';
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

//   alternative method
//   Widget ? activeScreen;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     activeScreen=StartScreen(switchScreen);
//   }

  void switchScreen() {
    setState(() {
      // activeScreen = QuestionScreen();
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
    if (activeScreen == 'result-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }
//   final screenWidget =  activeScreen == 'start-screen'
//                                      ? StartScreen(switchScreen)
//                                      : const QuestionScreen(),
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // child: activeScreen,
          child: screenWidget,

//           == 'start-screen'
//                   ? StartScreen(switchScreen)
//                   : const QuestionScreen(),
        ),
      ),
    );
  }
}

//int main
