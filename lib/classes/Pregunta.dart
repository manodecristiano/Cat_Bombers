class Pregunta {
  late String country;

  String pregunta = "Capital de : ";
  late String correctAnswer;
  List<String> options = [];
  String selected = 'Skipped';
  bool correct = false;

// Constructor que convierte un objeto JSON en una instancia de la clase
  Pregunta.fromJson(Map<String, dynamic> json)
      : country = json['country'],
        correctAnswer = json['capital'];

// Método para agregar opciones de respuesta a la pregunta
  void addOptions(List<String> newOptions) {
    pregunta += '$country';
    options.add(correctAnswer);
    options.addAll(newOptions);
    options.shuffle();
  }
}
