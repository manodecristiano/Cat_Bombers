import 'package:auto_size_text/auto_size_text.dart';
import 'package:cat_bombers/classes/Pregunta.dart';
import 'package:cat_bombers/classes/Questionario.dart';
import 'package:cat_bombers/pages/menu_home.dart';
import 'package:cat_bombers/pages/resultado_test.dart';
import 'package:flutter/material.dart';

class TestFallos extends StatefulWidget {
  final int totalPreguntas;
  final Questionario listadeFallos;

  const TestFallos(this.totalPreguntas, this.listadeFallos, {super.key});

  @override
  State<TestFallos> createState() => _TestFallosState();
}

//? -----------------Todo lo que engloba la pantalla Test_fallos Logica y Visuak -------------

class _TestFallosState extends State<TestFallos> {
  int questionIndex = 0;
  int progressBar = 1;
  int totalOptions = 4; //Todas las preguntas tienen siempre 4 opciones
  Questionario copiaListaFallos = Questionario(name: 'Lista de Re-Fallades', preguntas: []);
  Questionario listCorrects = Questionario(name: 'Lista de Salvades', preguntas: []);

//** -----------------Función que utlizamos para dar valor a variables -------------

  @override
  void initState() {
    super.initState();

    // Hacemos una copia de listadeFallos para trabajar con ella
    copiaListaFallos = Questionario(
      name: widget.listadeFallos.name,
      preguntas: List.from(widget.listadeFallos.preguntas),
    );
  }

//** ----------------------------------------------------------------------------*

//** -----------------LÓGICA DE LA INTERACCIÓN---------------------------------------

  void opcionSeleccionada(String seleccionDelUSER) {
    Pregunta preguntaActual = widget.listadeFallos.preguntas[questionIndex];
    /*   preguntaActual.selected = seleccionDelUSER; */

    // Si la respuesta es correcta, marcamos la pregunta como correcta
    if (seleccionDelUSER == preguntaActual.respuesta) {
      preguntaActual.correct = true;
      listCorrects.preguntas.add(preguntaActual);
    }

    // Pasar a la siguiente pregunta o mostrar resultados si terminamos
    setState(() {
      if (questionIndex < widget.totalPreguntas - 1) {
        questionIndex++;
        progressBar++;
      } else {
        finaldelTest(context);
      }
    });
  }
//** ----------------------------------------------------------------*

//** ----------AL FINAL DEL TEST MOSTRAMOS UN RESULTADO-------------------------------

  void finaldelTest(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => mostrarResultado(context),
    );

    setState(() {
      for (var pregunta in widget.listadeFallos.preguntas) {
        /*  for (int i = widget.listadeFallos.preguntas.length - 1; i >= 0; i--) {
        var pregunta = widget.listadeFallos.preguntas[i]; */
        for (var preguntaCorrect in listCorrects.preguntas) {
          debugPrint('-----------ID-LISTA-->' + pregunta.id.toString() + '-----------');
          debugPrint('-----------ID-CORRECT-->[' + preguntaCorrect.id.toString() + ']-----------');
          if (pregunta.id == preguntaCorrect.id) {
            copiaListaFallos.preguntas.remove(pregunta);
            // Actualizar el índice si el tamaño de la lista cambia asi no hay range Error
            questionIndex = copiaListaFallos.preguntas.length - 1;
            debugPrint('-----------TAMAÑO-----------');
            debugPrint(copiaListaFallos.preguntas.length.toString());
            break;
          }
        }
      }

      // Aquí igualamos las listas para iterar en la próxima ocasión sobre la nueva lista.
      widget.listadeFallos.preguntas.clear();
      widget.listadeFallos.preguntas.addAll(copiaListaFallos.preguntas);
    });
  }
//** ---------------------------------------------------------------------------------*

//* -----------------ALERT DEl RESULTADO---------------------

  Widget mostrarResultado(BuildContext context) {
    // Filtramos las preguntas correctas e incorrectas
    int numCorrectas = listCorrects.preguntas.length;
    int numIncorrectas = widget.totalPreguntas - numCorrectas;

    // Calculamos el porcentaje
    int porcentaje = ((numCorrectas / widget.totalPreguntas) * 100).toInt();

    return AlertDialog(
      title: const Text('Resultado', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
      backgroundColor: const Color.fromRGBO(249, 245, 229, 1.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Preguntas: ${widget.totalPreguntas}'),
          Text('Correctas: $numCorrectas',
              style: const TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold)),
          Text('Incorrectas: $numIncorrectas',
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
                  questionario: widget.listadeFallos,
                  numPreguntas: numCorrectas + numIncorrectas,
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
//** ---------------------------------------------------------------*

//* -----------------CREACIÓN DE LA INTERFAZ---------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 245, 229, 1.0),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black87,
        ),
        title: AutoSizeText(
          widget.listadeFallos.name,
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
            child: widget.listadeFallos.preguntas.isNotEmpty
                ? Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: AutoSizeText(
                            widget.listadeFallos.preguntas[questionIndex].id.toString(),
                            minFontSize: 16,
                            maxFontSize: 35,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: AutoSizeText(
                            widget.listadeFallos.preguntas[questionIndex].pregunta,
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
              // Evitar mostrar preguntas cuando no hay más
              if (questionIndex >= widget.listadeFallos.preguntas.length) {
                return const Text('No more questions.');
              }

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
                  title: AutoSizeText(widget.listadeFallos.preguntas[questionIndex].options[index]),
                  onTap: () {
                    opcionSeleccionada(widget.listadeFallos.preguntas[questionIndex].options[index]);
                  },
                ),
              );
            },
          ),
        ),
        TextButton(
          onPressed: () {
            opcionSeleccionada('No contestada');
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
  //** --------------------------------------*

//? --------------------------------------
}
