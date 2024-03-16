import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  QuestionSummary({super.key, required this.summarydata});

  final List<Map<String, Object>> summarydata;

  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summarydata.map((e) {
            return Row(
              children: [
                CircleAvatar(
                  child: Text(((e['question-index'] as int)).toString()),
                  backgroundColor: e['choosen-answer'] == e['correct-answer']
                      ? Colors.green
                      : Colors.red,
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ((e['question'] as String)).toString(),
                      style: GoogleFonts.lato(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      (e['choosen-answer'] as String),
                      style: TextStyle(
                          color: e['choosen-answer'] == e['correct-answer']
                              ? Colors.green
                              : Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      (e['correct-answer'] as String),
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    )
                  ],
                )),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
