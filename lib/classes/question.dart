class Question {
  late String country;

  String question = "Capital de : ";
  late String correctAnswer;
  List<String> options = [];
  String selected = 'Skipped';
  bool correct = false;
  Question.fromJson(Map<String, dynamic> json)
      : country = json['country'],
        correctAnswer = json['capital'];

  void addOptions(List<String> newOptions) {
    question += '$country';
    options.add(correctAnswer);
    options.addAll(newOptions);
    options.shuffle();
  }
}
