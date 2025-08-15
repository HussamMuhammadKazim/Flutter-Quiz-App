import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/home.dart';
import 'package:flutter_quiz/questionsScreen.dart';
import 'package:flutter_quiz/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = "Home";

  void switchScreen() {
    setState(() {
      activeScreen = "Quiz";
    });
  }

  void chooseAnswer(String answer) {
      selectedAnswers.add(answer);

      if (selectedAnswers.length == questions.length){
        setState(() {
          // selectedAnswers = [];
          activeScreen = "Results";
        });
      }
  }

  void restartQuiz() {
    setState(() { 
      selectedAnswers = [];
      activeScreen = "Home";
    });
  }


  @override
  Widget build(BuildContext context) {

    Widget screenWidget  = Home(switchScreen);
    if (activeScreen == "Quiz") {
      setState(() {
        screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
      });
    }
    if (activeScreen == "Results") {
      setState(() {
        screenWidget = ResultsScreen(choosenAnswers: selectedAnswers, onRestart: restartQuiz,);
      });
    }

    return  MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                Colors.deepPurpleAccent,
                Colors.deepPurple,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            )
          ),
          child: screenWidget
        )
      )
    );     
  }
}