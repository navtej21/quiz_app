import 'package:flutter/material.dart';
import 'package:course_quiz_app/main.dart';
import 'package:course_quiz_app/quiz.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  StartScreen({super.key, required this.function});

  void Function() function;

  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'images/quiz-logo.png',
            width: 300,
            color: Color.fromRGBO(150, 255, 252, 0.82),
          ),
          const SizedBox(
            height: 80,
          ),
          Text(
            'Learn Flutter In Fun Way!',
            style: GoogleFonts.lato(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
          ),
          SizedBox(
            height: 80,
          ),
          OutlinedButton.icon(
            onPressed: () {
              return function();
            },
            icon: Icon(Icons.arrow_forward_ios),
            label: Text('Click To Start'),
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          )
        ],
      ),
    );
  }
}
