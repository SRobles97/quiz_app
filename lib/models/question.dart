class Question {
  final String question;
  final List<String> answers;

  Question({required this.question, required this.answers});

  void shuffleAnswers() {
    answers.shuffle();
  }
}
