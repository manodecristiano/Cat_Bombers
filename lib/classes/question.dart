class Question {
  late String country;

  String question = "Capital de : ";
  late String correctAnswer;
  List<String> options = [];
  String selected = 'Skipped';
  bool correct = false;

// Constructor que convierte un objeto JSON en una instancia de la clase
  Question.fromJson(Map<String, dynamic> json)
      : country = json['country'],
        correctAnswer = json['capital'];

// Método para agregar opciones de respuesta a la pregunta
  void addOptions(List<String> newOptions) {
    question += '$country';
    options.add(correctAnswer);
    options.addAll(newOptions);
    options.shuffle();
  }
}
