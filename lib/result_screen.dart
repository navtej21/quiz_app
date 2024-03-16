import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:course_quiz_app/data/quiz_questions.dart';
import 'package:course_quiz_app/question_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(
      {super.key, required this.choosenanswer, required this.function});

  void Function() function;

  final List<String> choosenanswer;

  List<Map<String, Object>> getsummarydata() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < choosenanswer.length; i++) {
      summary.add({
        'question-index': i + 1,
        'question': lst[i].question,
        'correct-answer': lst[i].answers[0],
        'choosen-answer': choosenanswer[i]
      });
    }
    return summary;
  }

  Widget build(BuildContext context) {
    final numtotalquestions = lst.length;
    var numcorrectquestions = 0;
    final summarydata = getsummarydata();

    for (var i = 0; i < summarydata.length; i++) {
      if (summarydata[i]['choosen-answer'] ==
          summarydata[i]['correct-answer']) {
        numcorrectquestions += 1;
      }
    }
    return SizedBox(
        width: double.infinity,
        child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.deepPurpleAccent, Colors.pinkAccent])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You Have ${numcorrectquestions} Out Of ${numtotalquestions} Questions Correctly Answered',
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                QuestionSummary(summarydata: getsummarydata()),
                SizedBox(height: 30),
                OutlinedButton(
                    onPressed: () {
                      return function();
                    },
                    child: Text('Restart Quiz'))
              ],
            )));
  }
}
