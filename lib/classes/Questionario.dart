import 'package:cat_bombers/classes/Pregunta.dart';

class Questionario {
  String name;
  List<Pregunta> preguntas;
  int right = 0;

  Questionario({required this.name, required this.preguntas});

  double get percent => (right / preguntas.length) * 100;

  map(String Function(dynamic user) param0) {}
}
