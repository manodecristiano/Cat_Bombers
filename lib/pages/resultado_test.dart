import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../classes/Questionario.dart';

class ResultadoTest extends StatelessWidget {
  const ResultadoTest({Key? key, required this.questionario, required this.numPreguntas, required this.porcentaje})
      : super(key: key);

  final int porcentaje;
  final int numPreguntas;
  final Questionario questionario;

  @override
  Widget build(BuildContext context) {
    debugPrint('-------DENTRO DE resultado_test------');

    debugPrint('porcentaje ==> ${porcentaje.toString()}');
    debugPrint('numPreguntas ==> ${numPreguntas.toString()}');

    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 245, 229, 1.0),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black87,
        ), // Aquí reemplazamos el botón de retroceso con un icono de "Home"
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            // Navega a la pantalla principal
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
        title: const AutoSizeText(
          'Resultado del test',
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        elevation: 5,
        backgroundColor: Colors.amber[200],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(left: 2, right: 2, top: 2, bottom: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black45, width: 1),
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Text('Preguntas : $numPreguntas', style: const TextStyle(color: Colors.brown)),
                Text('Porcentaje :  $porcentaje%'),
              ]),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true, //para que no se expanda tanto
                itemCount: numPreguntas,
                itemBuilder: (_, index) {
                  return Card(
                    color:
                        questionario.preguntas[index].correct ? Colors.greenAccent.shade200 : Colors.redAccent.shade200,
                    child: ListTile(
                      leading: questionario.preguntas[index].correct
                          ? Icon(Icons.fire_truck, color: Colors.green.shade900)
                          : Icon(Icons.fire_hydrant_alt, color: Colors.red.shade900),
                      title: AutoSizeText(questionario.preguntas[index].pregunta),
                      subtitle: AutoSizeText(
                        questionario.preguntas[index].selected,
                        style: TextStyle(
                          decoration:
                              questionario.preguntas[index].correct ? TextDecoration.none : TextDecoration.lineThrough,
                        ),
                      ),
                      //  trailing:
                      //    AutoSizeText(quiz.questions[index].correctAnswer),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
