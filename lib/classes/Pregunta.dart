class Pregunta {
  int id = 0;
  String pregunta = "";
  late String respuesta;
  String categoria = "";
  List<String> options = [];
  String selected = 'Skipped';
  bool correct = false;
  late String opcion1;
  late String opcion2;
  late String opcion3;

  Pregunta({
    required this.id,
    required this.pregunta,
    required this.respuesta,
    required this.opcion1,
    required this.opcion2,
    required this.opcion3,
  }) {}

  // Constructor que convierte un objeto JSON en una instancia de la clase
  Pregunta.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        pregunta = json['pregunta'],
        respuesta = json['respuesta'],
        categoria = json['categoria'],
        opcion1 = json['opcion1'], // Asignar un valor vacío si no existe
        opcion2 = json['opcion2'],
        opcion3 = json['opcion3'] {
    addOptions([opcion1, opcion2, opcion3]);
  }

  void addOptions(List<String> newOptions) {
    // Combina las opciones sin duplicar y mezcla
    options = {respuesta, ...newOptions}.toList();
    options.shuffle(); // Mezclar para orden aleatorio
  }
}
