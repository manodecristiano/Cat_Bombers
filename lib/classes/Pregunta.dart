class Pregunta {


  String pregunta = "Pregunta numero : ";
  late String respuesta;
  List<String> options = [];
  String selected = 'Skipped';
  bool correct = false;

// Constructor que convierte un objeto JSON en una instancia de la clase
Pregunta.fromJson(Map<String, dynamic> json)
      : pregunta = json['pregunta'], // Asigna la pregunta desde el JSON
        respuesta = json['respuesta']; // Asigna la respuesta correcta desde el JSON

// Método para agregar opciones de respuesta a la pregunta
  void addOptions(List<String> newOptions) {
    pregunta;
    options.add(respuesta);
    options.addAll(newOptions);
    options.shuffle();
  }
}
