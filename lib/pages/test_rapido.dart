import 'package:auto_size_text/auto_size_text.dart';
import 'package:cat_bombers/classes/Pregunta.dart';
import 'package:cat_bombers/classes/Questionario.dart';
import 'package:cat_bombers/pages/menu_home.dart';
import 'package:cat_bombers/pages/resultado_test.dart';
import 'package:flutter/material.dart';

Questionario questionariodeFalladas = Questionario(name: 'Test Fallades', preguntas: []);

class TestRapido extends StatefulWidget {
  final int totaldePreguntas;
  final String tema;
  const TestRapido(this.totaldePreguntas, this.tema, {super.key});

  @override
  State<TestRapido> createState() => _TestRapido();
}

class _TestRapido extends State<TestRapido> {
  int totalOptions = 4;
  int questionIndex = 0;
  int progressBar = 1;

  Questionario todasLasPreguntas = Questionario(name: 'Test Rápid', preguntas: []);
  List<Pregunta> listaPreguntas = [];

//Creamos el listado de preguntas aleatorias
  // Future<void> readJson() async {
  //   final String response = await rootBundle.loadString('assets/paises.json');
  //   final List<dynamic> data = await json.decode(response);
  //   List<int> optionList = List<int>.generate(data.length, (i) => i);
  //   List<int> questionAdded = [];

  //   while (true) {
  //     optionList.shuffle();
  //     int correctAnswer = optionList[0];
  //     if (questionAdded.contains(correctAnswer)) continue;
  //     questionAdded.add(correctAnswer);

  //     List<String> otherOptions = [];
  //     for (var option in optionList.sublist(1, totalOptions)) {
  //       otherOptions.add(data[option]['respuesta']);
  //     }

  //     Question question = Question.fromJson(data[correctAnswer]);
  //     question.addOptions(otherOptions);
  //     quiz.questions.add(question);
  //     if (quiz.questions.length >= widget.totalQuestions) break;
  //   }

  //   setState(() {});
  // }

  Future<void> crearlistadePreguntas() async {
    listaPreguntas = [
      Pregunta.fromJson({
        'id': 0,
        'categoria': 'Hidráulica',
        'pregunta': 'De qué color es el caballo blanco?',
        'respuesta': 'Correcta',
        'opcion1': 'Incorrecta',
        'opcion2': 'Incorrecta',
        'opcion3': 'Incorrecta',
      }),
      Pregunta.fromJson({
        'id': 1,
        'categoria': 'Electricitat',
        'pregunta': 'España es el mejor país?',
        'respuesta': 'Correcta',
        'opcion1': 'Incorrecta',
        'opcion2': 'Incorrecta',
        'opcion3': 'Incorrecta',
      }),
      Pregunta.fromJson({
        'id': 2,
        'categoria': 'Hidráulica',
        'pregunta': 'Donde vives?',
        'respuesta': 'Correcta',
        'opcion1': 'Incorrecta',
        'opcion2': 'Incorrecta',
        'opcion3': 'Incorrecta',
      }),
      Pregunta.fromJson({
        'id': 3,
        'categoria': 'Hidráulica',
        'pregunta': 'Cuántas estrellas existen?',
        'respuesta': 'Correcta',
        'opcion1': 'Incorrecta',
        'opcion2': 'Incorrecta',
        'opcion3': 'Incorrecta',
      }),
      Pregunta.fromJson({
        'id': 4,
        'categoria': 'Hidráulica',
        'pregunta': 'Después del 4 viene el...?',
        'respuesta': 'Correcta',
        'opcion1': 'Incorrecta',
        'opcion2': 'Incorrecta',
        'opcion3': 'Incorrecta',
      }),
      Pregunta.fromJson({
        'id': 5,
        'categoria': 'Electricitat',
        'pregunta': '5 por el culo...?',
        'respuesta': 'Correcta',
        'opcion1': 'Incorrecta',
        'opcion2': 'Incorrecta',
        'opcion3': 'Incorrecta',
      }),
      Pregunta.fromJson({
        'id': 6,
        'categoria': 'Hidráulica',
        'pregunta': 'Helicóptero lleva H?',
        'respuesta': 'Correcta',
        'opcion1': 'Incorrecta',
        'opcion2': 'Incorrecta',
        'opcion3': 'Incorrecta',
      }),
      Pregunta.fromJson({
        'id': 7,
        'categoria': 'Construcció',
        'pregunta': 'Mil, tres, uno, qué tienen en común?',
        'respuesta': 'Correcta',
        'opcion1': 'Incorrecta',
        'opcion2': 'Incorrecta',
        'opcion3': 'Incorrecta',
      }),
      Pregunta.fromJson({
        'id': 8,
        'categoria': 'Hidráulica',
        'pregunta': 'Tailandia es un país?',
        'respuesta': 'Correcta',
        'opcion1': 'Incorrecta',
        'opcion2': 'Incorrecta',
        'opcion3': 'Incorrecta',
      }),
      Pregunta.fromJson({
        'id': 9,
        'categoria': 'Electricitat',
        'pregunta': '1988 fue el mejor año?',
        'respuesta': 'Correcta',
        'opcion1': 'Incorrecta',
        'opcion2': 'Incorrecta',
        'opcion3': 'Incorrecta',
      }),
      Pregunta.fromJson({
        'id': 10,
        'categoria': 'Hidráulica',
        'pregunta': 'Acabarás la app?',
        'respuesta': 'Correcta',
        'opcion1': 'Incorrecta',
        'opcion2': 'Incorrecta',
        'opcion3': 'Incorrecta',
      }),
      Pregunta.fromJson({
        'id': 11,
        'categoria': 'Constitució',
        'pregunta': 'Puerto Rico está rico?',
        'respuesta': 'Correcta',
        'opcion1': 'Incorrecta',
        'opcion2': 'Incorrecta',
        'opcion3': 'Incorrecta',
      }),
      Pregunta.fromJson({
        'id': 12,
        'categoria': 'Constitució',
        'pregunta': 'Dónde naciste?',
        'respuesta': 'Correcta',
        'opcion1': 'Incorrecta',
        'opcion2': 'Incorrecta',
        'opcion3': 'Incorrecta',
      }),
      Pregunta.fromJson({
        'id': 13,
        'categoria': 'Construcció',
        'pregunta': 'Cuántas pecas tienes?',
        'respuesta': 'Correcta',
        'opcion1': 'Incorrecta',
        'opcion2': 'Incorrecta',
        'opcion3': 'Incorrecta',
      }),
      Pregunta.fromJson({
        'id': 14,
        'categoria': 'Hidráulica',
        'pregunta': 'Provincias de España?',
        'respuesta': 'Correcta',
        'opcion1': 'Incorrecta',
        'opcion2': 'Incorrecta',
        'opcion3': 'Incorrecta',
      }),
      Pregunta.fromJson({
        'id': 15,
        'categoria': 'Hidráulica',
        'pregunta': 'Tu número favorito?',
        'respuesta': 'Correcta',
        'opcion1': 'Incorrecta',
        'opcion2': 'Incorrecta',
        'opcion3': 'Incorrecta',
      }),
      Pregunta.fromJson({
        'id': 16,
        'categoria': 'Hidráulica',
        'pregunta': 'Cuántos son 2+2?',
        'respuesta': 'Correcta',
        'opcion1': 'Incorrecta',
        'opcion2': 'Incorrecta',
        'opcion3': 'Incorrecta',
      }),
      Pregunta.fromJson({
        'id': 17,
        'categoria': 'Construcció',
        'pregunta': 'Error 500 significa...?',
        'respuesta': 'Correcta',
        'opcion1': 'Incorrecta',
        'opcion2': 'Incorrecta',
        'opcion3': 'Incorrecta',
      }),
      Pregunta.fromJson({
        'id': 18,
        'categoria': 'Electricitat',
        'pregunta': 'De qué color es el verde?',
        'respuesta': 'Correcta',
        'opcion1': 'Incorrecta',
        'opcion2': 'Incorrecta',
        'opcion3': 'Incorrecta',
      }),
      Pregunta.fromJson({
        'id': 19,
        'categoria': 'Hidráulica',
        'pregunta': 'Tu actor favorito?',
        'respuesta': 'Correcta',
        'opcion1': 'Incorrecta',
        'opcion2': 'Incorrecta',
        'opcion3': 'Incorrecta',
      }),
    ];

    /*  Pregunta pregunta0 = Pregunta.fromJson({
      'id': 0,
      'categoria': 'Hidráulica',
      'pregunta': 'De qué color es el caballo blanco?',
      'respuesta': 'Correcta',
    });
    pregunta0.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    todasLasPreguntas.preguntas.add(pregunta0); */

    setState(() {}); // Actualizació de que la pantalla  crear listadepreguntas
  }

  @override
  void initState() {
    super.initState();
    //readJson();
    crearlistadePreguntas().then((_) {
      filtrarporcategoria(widget.tema); // Filtrar preguntas solo después de que se hayan cargado
    });
  }

//** -----------------FUNCIÓN QUE SE LLAMA SI ES POR TEMES---------------------------------------

  void filtrarporcategoria(tema) {
    todasLasPreguntas.preguntas.clear();
    if (tema == '') {
      debugPrint('-------TEMA VACIO------ ');
      for (var pregunta in listaPreguntas) {
        todasLasPreguntas.preguntas.add(pregunta);
      }
    } else {
      debugPrint('-------TEMA------ $tema');
      for (var pregunta in listaPreguntas) {
        debugPrint('-------CATEGORIA------$pregunta.categoria');
        if (pregunta.categoria == tema) {
          debugPrint('----ENTRO----');
          todasLasPreguntas.preguntas.add(pregunta);
        }
      }
    }
    // Mezcla las opciones de cada pregunta filtrada
    for (var pregunta in todasLasPreguntas.preguntas) {
      pregunta.addOptions([pregunta.opcion1, pregunta.opcion2, pregunta.opcion3]);
    }
    setState(() {}); // Actualizació de que la pantalla  después de filtrar
  }

//** ----------------------------------------------------------------------------*

//** -----------------LÓGICA DE LA INTERACCIÓN---------------------------------------

  void _optionSelected(String userSelected) {
//Marcar como opción correcta si es la recogida en el Json
    todasLasPreguntas.preguntas[questionIndex].selected = userSelected;
    if (userSelected == todasLasPreguntas.preguntas[questionIndex].respuesta) {
      debugPrint('------------SI CORRECTA-----------');
      todasLasPreguntas.preguntas[questionIndex].correct = true;
//Aumentamnos el valor total de correctas
      todasLasPreguntas.right += 1;
    } else {
      debugPrint('--------NO correct----------');
//añadimos a la lista de fallos
      debugPrint(
          '----------Añadida a testFails===>[${todasLasPreguntas.preguntas[questionIndex].pregunta}]-----------');
      questionariodeFalladas.preguntas.add(todasLasPreguntas.preguntas[questionIndex]);
    }

//Siguiente pregunta y recarga la pantalla
    if (questionIndex < widget.totaldePreguntas - 1) {
      questionIndex += 1;
      progressBar += 1;
    } else {
      showDialog(
          barrierDismissible: false, context: context, builder: (BuildContext context) => resultadoALert(context));
    }

    setState(() {});
  }

//** ----------------------------------------------------------------------------*

//** ----------AL FINAL DEL TEST MOSTRAMOS UN RESULTADO-------------------------------

  Widget resultadoALert(BuildContext context) {
    int porcentaje = ((todasLasPreguntas.right / widget.totaldePreguntas) * 100).toInt();
    int numPreguntas = widget.totaldePreguntas;

    return AlertDialog(
      title: const Text('Resultado', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
      backgroundColor: const Color.fromRGBO(249, 245, 229, 1.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Preguntas  :  ' '${widget.totaldePreguntas}'),
          Text('Correctas   :  ' '${todasLasPreguntas.right}',
              style: const TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold)),
          Text(
              'Incorrectas:  '
              '${(widget.totaldePreguntas - todasLasPreguntas.right)}',
              style: const TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
          Text('Porcentaje :  ' '$porcentaje%'),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: ((context) => ResultadoTest(
                      questionario: todasLasPreguntas, numPreguntas: numPreguntas, porcentaje: porcentaje)),
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Colors.amber),
              foregroundColor: WidgetStateProperty.all<Color>(Colors.black87),
            ),
            child: const Text('Ver respuestas')),
        TextButton(
          onPressed: () {
            //NAVEGAR HACIA ATRáS
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

//** ----------------------------------------------------------------*

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 245, 229, 1.0),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black87,
        ),
        title: AutoSizeText(
          todasLasPreguntas.name,
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
            child: todasLasPreguntas.preguntas.isNotEmpty
                ? Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(2),
                          child: AutoSizeText(
                            todasLasPreguntas.preguntas[questionIndex].id.toString(),
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
                            todasLasPreguntas.preguntas[questionIndex].categoria.toString(),
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
                            todasLasPreguntas.preguntas[questionIndex].pregunta,
                            minFontSize: 16,
                            maxFontSize: 35,
                            style: const TextStyle(
                              color: Colors.black54,
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
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  leading: AutoSizeText('${index + 1}'),
                  title: AutoSizeText(todasLasPreguntas.preguntas[questionIndex].options[index]),
                  onTap: () {
                    _optionSelected(todasLasPreguntas.preguntas[questionIndex].options[index]);
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
              value: (questionIndex + 1) / widget.totaldePreguntas,
              minHeight: 20,
            ),
          ),
        ),
      ]),
    );
  }
}
