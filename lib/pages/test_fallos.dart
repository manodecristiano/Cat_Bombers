import 'package:auto_size_text/auto_size_text.dart';
import 'package:cat_bombers/classes/Pregunta.dart';
import 'package:cat_bombers/classes/Questionario.dart';
import 'package:cat_bombers/pages/menu_home.dart';
import 'package:cat_bombers/pages/resultado_test.dart';
import 'package:flutter/material.dart';

class FallosQuestionario extends StatefulWidget {
  final int totalPreguntas;
  final Questionario questionariodeFallos;

  const FallosQuestionario(this.totalPreguntas, this.questionariodeFallos, {super.key});

  @override
  State<FallosQuestionario> createState() => _FallosQuestionarioState();
}

class _FallosQuestionarioState extends State<FallosQuestionario> {
  int questionIndex = 0;
  int progressBar = 1;
  int totalOptions = 4; // Si todas las preguntas tienen siempre 4 opciones
  late int preguntasRestantes;

  Questionario listREFails = Questionario(name: 'Lista de Re-Fallades', preguntas: []);
  Questionario listCorrects = Questionario(name: 'Lista de Salvades', preguntas: []);

  @override
  void initState() {
    super.initState();
    preguntasRestantes = widget.totalPreguntas;
  }

  void _optionSelected(String userSelected) {
    Pregunta preguntaActual = widget.questionariodeFallos.preguntas[questionIndex];
    preguntaActual.selected = userSelected;

    // Si la respuesta es correcta, marcamos la pregunta como correcta
    if (userSelected == preguntaActual.respuesta) {
      preguntaActual.correct = true;
      listCorrects.preguntas.add(preguntaActual);
    } else {
      // Si es incorrecta, la añadimos a la lista de fallos
      listREFails.preguntas.add(preguntaActual);
    }

    // Pasar a la siguiente pregunta o mostrar resultados si terminamos
    setState(() {
      if (questionIndex < widget.totalPreguntas - 1) {
        questionIndex++;
      } else {
        _mostrarDialogoResultados(context); // Mostrar el resultado al finalizar
      }

      // Incrementar el progreso de la barra
      progressBar++;
    });
  }

  void _mostrarDialogoResultados(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => _buildResultDialog(context),
    );
  }

  void eliminarDuplicados() {
    listREFails.preguntas = listREFails.preguntas.toSet().toList();
  }

  Widget _buildResultDialog(BuildContext context) {
    // Filtramos las preguntas correctas e incorrectas
    int correctas = listCorrects.preguntas.length;
    int incorrectas = widget.totalPreguntas - correctas;

    // Calculamos el porcentaje
    int porcentaje = ((correctas / widget.totalPreguntas) * 100).toInt();

    return AlertDialog(
      title: const Text('Resultado', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
      backgroundColor: const Color.fromRGBO(249, 245, 229, 1.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Preguntas: ${widget.totalPreguntas}'),
          Text('Correctas: $correctas', style: const TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold)),
          Text('Incorrectas: $incorrectas',
              style: const TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
          Text('Porcentaje: $porcentaje%'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ResultadoTest(
                  questionario: widget.questionariodeFallos,
                  numPreguntas: correctas + incorrectas,
                  porcentaje: porcentaje,
                ),
              ),
            );
          },
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(Colors.amber),
            foregroundColor: WidgetStateProperty.all<Color>(Colors.black87),
          ),
          child: const Text('Ver respuestas'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: ((context) => const Homepage()),
                ));
          },
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(Colors.amber),
            foregroundColor: WidgetStateProperty.all<Color>(Colors.black87),
          ),
          child: const Text('Cerrar'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 245, 229, 1.0),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black87,
        ),
        title: AutoSizeText(
          widget.questionariodeFallos.name,
          style: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        elevation: 5,
        backgroundColor: Colors.amber[200],
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 450),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
            child: widget.questionariodeFallos.preguntas.isNotEmpty
                ? Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: AutoSizeText(
                            widget.questionariodeFallos.preguntas[questionIndex].pregunta,
                            minFontSize: 16,
                            maxFontSize: 35,
                            style: const TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : const CircularProgressIndicator(color: Colors.amber, backgroundColor: Colors.transparent),
          ),
        ),
        Flexible(
          child: ListView.builder(
            itemCount: totalOptions,
            itemBuilder: (_, index) {
              return Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black87),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  leading: AutoSizeText('${index + 1}'),
                  title: AutoSizeText(widget.questionariodeFallos.preguntas[questionIndex].options[index]),
                  onTap: () {
                    _optionSelected(widget.questionariodeFallos.preguntas[questionIndex].options[index]);
                  },
                ),
              );
            },
          ),
        ),
        TextButton(
          onPressed: () {
            _optionSelected('No contestada');
          },
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(Colors.white70),
            foregroundColor: WidgetStateProperty.all<Color>(Colors.black45),
          ),
          child: const Text('Pasar'),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: LinearProgressIndicator(
              color: Colors.amber[700],
              backgroundColor: const Color(0xFFD9D9D9),
              value: progressBar / widget.totalPreguntas,
              minHeight: 20,
            ),
          ),
        ),
      ]),
    );
  }
}
