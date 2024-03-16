import 'package:course_quiz_app/data/quiz_questions.dart';
import 'package:course_quiz_app/homepage.dart';
import 'package:course_quiz_app/question_screen.dart';
import 'package:course_quiz_app/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Quiz extends StatefulWidget {
  _QuizScreen createState() {
    return _QuizScreen();
  }
}

class _QuizScreen extends State<Quiz> {
  List<String> selectedanswer = [];
  var activescreen = 'start-screen';

  @override
  void switchscreen() {
    setState(() {
      activescreen = 'question-screen';
    });
  }

  void chooseanswer(String answer) {
    selectedanswer.add(answer);

    if (selectedanswer.length == lst.length) {
      setState(() {
        activescreen = 'result-screen';
      });
    }
  }

  void restartquiz() {
    setState(() {
      selectedanswer = [];
      activescreen = 'start-screen';
    });
  }

  Widget build(BuildContext context) {
    Widget screen = StartScreen(function: switchscreen);
    if (activescreen == 'question-screen') {
      screen = QuestionScreen(selectedanswer: chooseanswer);
    }

    if (activescreen == 'result-screen') {
      screen = ResultScreen(
        choosenanswer: selectedanswer,
        function: restartquiz,
      );
    }
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.deepPurpleAccent, Colors.pinkAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: screen,
    ));
  }
}
