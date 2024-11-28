class Pregunta {
  int id = 0;
  String pregunta = "";
  late String respuesta;
  String categoria = "";
  List<String> options = [];
  String selected = 'Skipped';
  bool correct = false;

  Pregunta({
    required this.id,
    required this.pregunta,
    required this.respuesta,
    required this.options,
  });

// Constructor que convierte un objeto JSON en una instancia de la clase
  Pregunta.fromJson(Map<String, dynamic> json)
      : pregunta = json['pregunta'], // Asigna la pregunta desde el JSON
        respuesta = json['respuesta'],
        id = json['id'],
        categoria = json['categoria'] {
    // Agrega todas las opciones, incluida la respuesta correcta
    addOptions([
      json['opcion1'] ?? '',
      json['opcion2'] ?? '',
      json['opcion3'] ?? '',
    ]);
  } // Asigna la respuesta correcta desde el JSON

// Método para agregar opciones de respuesta a la pregunta
  void addOptions(List<String> newOptions) {
    pregunta;
    options.add(respuesta);
    options.addAll(newOptions);
    options.shuffle();
  }
}
