class Question {
  final String question;
  final List<String> options;
  final int answerIndex;

  const Question({
    required this.answerIndex,
    required this.question,
    required this.options,
  });
}
