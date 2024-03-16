class QuizQuestion {
  QuizQuestion(this.question, this.answers);
  final String question;
  final List<String> answers;

  List<String> getshuffledanswers() {
    final List<String> shuffledlist = List.of(answers);
    shuffledlist.shuffle();
    return shuffledlist;
  }
}
