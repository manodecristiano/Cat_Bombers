import 'package:cat_bombers/classes/question.dart';

class Quiz {
  String name;
  List<Question> questions;
  int right = 0;

  Quiz({required this.name, required this.questions});

  double get percent => (right / questions.length) * 100;

  map(String Function(dynamic user) param0) {}
}
