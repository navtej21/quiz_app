import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answers, required this.ontap});
  final String answers;
  final void Function() ontap;

  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          return ontap();
        },
        child: Text(
          answers,
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(fontSize: 15),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ));
  }
}
