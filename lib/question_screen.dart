import 'package:course_quiz_app/answer_button/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:course_quiz_app/data/quiz_questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  QuestionScreen({super.key, required this.selectedanswer});

  void Function(String str) selectedanswer;
  State<QuestionScreen> createState() => _QuestionScreen();
}

class _QuestionScreen extends State<QuestionScreen> {
  var index = 0;
  @override
  void answernextquestion(String answer) {
    widget.selectedanswer(answer);
    setState(() {
      if (index < lst.length - 1) {
        index += 1;
      }
    });
  }

  Widget build(BuildContext context) {
    final currentquestion = lst[index];

    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: EdgeInsets.all(40),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.deepPurpleAccent, Colors.pinkAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  currentquestion.question,
                  style: GoogleFonts.lato(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                ...currentquestion.getshuffledanswers().map((e) {
                  return AnswerButton(
                      answers: e,
                      ontap: () {
                        return answernextquestion(e);
                      });
                }),
                SizedBox(height: 60)
              ]),
        ));
  }
}
