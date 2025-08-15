import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.choosenAnswers, required this.onRestart});

  final List<String> choosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        "question_index" : i,
        "question" : questions[i].text,
        "correct_answer" : questions[i].answers[0],
        "user_answer" : choosenAnswers[i]   
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data["user_answer"] == data["correct_answer"];
    }).length;

    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You answered $numCorrectQuestions of $numTotalQuestions questions correctly!", textAlign: TextAlign.center,style: TextStyle(
              color: const Color.fromARGB(255, 245, 80, 220),
              fontSize: 22,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 30,),
            QuestionsSummary(summaryData),
            SizedBox(height: 30,),
            TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white
              ),
              onPressed: onRestart,
              icon: Icon(Icons.refresh),
              label: const Text("Restart Quiz!", style: TextStyle(
                fontSize: 18
              ),),
            )
          ],
        ),
      )
    );
  }
}