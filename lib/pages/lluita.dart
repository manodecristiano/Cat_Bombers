import 'package:auto_size_text/auto_size_text.dart';
import 'package:cat_bombers/classes/Questionario.dart';
import 'package:cat_bombers/classes/Pregunta.dart';
import 'package:cat_bombers/pages/menu_home.dart';
import 'package:cat_bombers/pages/resultado_test.dart';
import 'package:flutter/material.dart';

Questionario questionariodeFalladas = Questionario(name: 'Test Fallades', preguntas: []);

class LLuita extends StatefulWidget {
  @override
  State<LLuita> createState() => _LLuita();
  const LLuita({super.key});
}

class _LLuita extends State<LLuita> {
  int totalOptions = 4;
  int totaldePreguntas = 5;
  bool mostrarRespuestasTest1 = false;
  bool mostrarRespuestasTest2 = false;
  bool test1Terminado = false;
  bool test2Terminado = false;

  int touchedOptionIndex = -1; // Índice de la opción tocada (naranja)
  int selectedOptionIndex = -1; // Índice de la opción seleccionada (verde)

  // Test 1 variables
  Questionario test1Preguntas = Questionario(name: 'Test 1', preguntas: []);
  int test1Index = 0;
  int test1Progress = 1;
  int test1RightAnswers = 0;

  // Test 2 variables
  Questionario test2Preguntas = Questionario(name: 'Test 2', preguntas: []);
  int test2Index = 0;
  int test2Progress = 1;
  int test2RightAnswers = 0;

  // Lista compartida de preguntas
  List<Pregunta> listaPreguntas = [];

  Future<void> crearlistadePreguntas() async {
    listaPreguntas = [
      Pregunta.fromJson({
        'id': 0,
        'categoria': 'Hidráulica',
        'pregunta': "¿En que país no hemos estado ninguno de los 2??",
        'respuesta': "Bélgica"
      }),
      Pregunta.fromJson({
        'id': 1,
        'categoria': 'Electricitat',
        'pregunta': '¿Que día empezamos nuestra relación sentimental?',
        'respuesta': 'treinta de marzo de 2023'
      }),
      Pregunta.fromJson({
        'id': 2,
        'categoria': 'Hidráulica',
        'pregunta': '¿Cuál es el país con más hablantes nativos de español en el mundo?',
        'respuesta': 'México'
      }),
      Pregunta.fromJson({
        'id': 3,
        'categoria': 'Hidráulica',
        'pregunta':
            ': ¿Qué país es conocido como la cuna del Renacimiento y qué ciudad fue su principal centro cultural?',
        'respuesta': ' Italia'
      }),
      Pregunta.fromJson({
        'id': 4,
        'categoria': 'Hidráulica',
        'pregunta': '¿En qué país se originaron los Juegos Olímpicos antiguos y qué ciudad los albergaba?',
        'respuesta': 'Los Juegos Olímpicos antiguos se originaron en Grecia y se celebraban en la ciudad de Olimpia.'
      }),
      Pregunta.fromJson({
        'id': 5,
        'categoria': 'Electricitat',
        'pregunta':
            '¿Qué monumento histórico fue construido como una tumba en la India y es considerado una de las siete maravillas del mundo moderno?',
        'respuesta':
            'El Taj Mahal fue construido como una tumba en la India y es una de las siete maravillas del mundo moderno.'
      }),

      /*  Pregunta.fromJson(
          {'id': 6, 'categoria': 'Hidráulica', 'pregunta': 'Helicóptero lleva H?', 'respuesta': 'Correcta'}),
      Pregunta.fromJson({
        'id': 7,
        'categoria': 'Construcció',
        'pregunta': 'Mil, tres, uno, qué tienen en común?',
        'respuesta': 'Correcta'
      }),
      Pregunta.fromJson(
          {'id': 8, 'categoria': 'Hidráulica', 'pregunta': 'Tailandia es un país?', 'respuesta': 'Correcta'}),
      Pregunta.fromJson(
          {'id': 9, 'categoria': 'Electricitat', 'pregunta': '1988 fue el mejor año?', 'respuesta': 'Correcta'}),
      Pregunta.fromJson({'id': 10, 'categoria': 'Hidráulica', 'pregunta': 'Acabarás la app?', 'respuesta': 'Correcta'}),
      Pregunta.fromJson(
          {'id': 11, 'categoria': 'Constitució', 'pregunta': 'Puerto Rico está rico?', 'respuesta': 'Correcta'}),
      Pregunta.fromJson({'id': 12, 'categoria': 'Constitució', 'pregunta': 'Dónde naciste?', 'respuesta': 'Correcta'}),
      Pregunta.fromJson(
          {'id': 13, 'categoria': 'Construcció', 'pregunta': 'Cuántas pecas tienes?', 'respuesta': 'Correcta'}),
      Pregunta.fromJson(
          {'id': 14, 'categoria': 'Hidráulica', 'pregunta': 'Provincias de España?', 'respuesta': 'Correcta'}),
      Pregunta.fromJson(
          {'id': 15, 'categoria': 'Hidráulica', 'pregunta': 'Tu número favorito?', 'respuesta': 'Correcta'}),
      Pregunta.fromJson({'id': 16, 'categoria': 'Hidráulica', 'pregunta': 'Cuántos son 2+2?', 'respuesta': 'Correcta'}),
      Pregunta.fromJson(
          {'id': 17, 'categoria': 'Construcció', 'pregunta': 'Error 500 significa...?', 'respuesta': 'Correcta'}),
      Pregunta.fromJson(
          {'id': 18, 'categoria': 'Electricitat', 'pregunta': 'De qué color es el verde?', 'respuesta': 'Correcta'}),
      Pregunta.fromJson(
          {'id': 19, 'categoria': 'Hidráulica', 'pregunta': 'Tu actor favorito?', 'respuesta': 'Correcta'}), */
    ];

    // Maneja la interacción al tocar una opción
    void _handleOptionTapped(int optionIndex) {
      setState(() {
        if (touchedOptionIndex == optionIndex) {
          // Si ya estaba tocada, se selecciona
          selectedOptionIndex = optionIndex;
          touchedOptionIndex = -1; // Resetea el estado de tocada
        } else {
          // Si no estaba tocada, marca como tocada
          touchedOptionIndex = optionIndex;
        }
      });
    }

    for (var pregunta in listaPreguntas) {
      // Asegúrate de que las opciones estén inicializadas
      pregunta.addOptions([
        'Lorem ipsum 1 Lorem ipsumLorem Chiuwuka persoinelle yemapeil.',
        'Ameneci cuague 2 viva,Ipsum lorem. Lorem ipsum Lorem ipsumLorem Chiuwuka persoinelle yemapeil.',
        'Lorem jeterly 3 viure barsovia ipsum Lorem ipsumLorem Chiuwuka persoinelle yemapeil  persoinelle yemapeil Nepal. Lorem jeterly 3 viure barsovia ipsum Lorem.'
      ]);

      // Copia para test 1
      var copiaTest1 = Pregunta(
        id: pregunta.id,
        pregunta: pregunta.pregunta,
        respuesta: pregunta.respuesta,
        options: List<String>.from(pregunta.options), // Clonar opciones
      );
      test1Preguntas.preguntas.add(copiaTest1);

      // Copia para test 2
      var copiaTest2 = Pregunta(
        id: pregunta.id,
        pregunta: pregunta.pregunta,
        respuesta: pregunta.respuesta,
        options: List<String>.from(pregunta.options), // Clonar opciones
      );
      test2Preguntas.preguntas.add(copiaTest2);
    }

    setState(() {}); // Actualizació de que la pantalla  crear listadepreguntas
  }

  @override
  void initState() {
    super.initState();
    //readJson();
    crearlistadePreguntas();
  }

//** -----------------LÓGICA DE LA INTERACCIÓN---------------------------------------

  void _handleOptionSelectedTest1(String selectedOption) {
    if (test1Preguntas.preguntas[test1Index].respuesta == selectedOption) {
      test1RightAnswers++;
    }

    setState(() {
      if (test1Index < test1Preguntas.preguntas.length - 1) {
        test1Index++;
        test1Progress++;
        mostrarRespuestasTest1 = false;
      } else {
        test1Terminado = true;
        if (test2Terminado) _mostrarResultadoFinal();
      }
    });
  }

  void _handleOptionSelectedTest2(String selectedOption) {
    if (test2Preguntas.preguntas[test2Index].respuesta == selectedOption) {
      test2RightAnswers++;
    }

    setState(() {
      if (test2Index < test2Preguntas.preguntas.length - 1) {
        test2Index++;
        test2Progress++;
        mostrarRespuestasTest2 = false;
      } else {
        test2Terminado = true;
        if (test1Terminado) _mostrarResultadoFinal();
      }
    });
  }

  // Maneja la interacción al tocar una opción
  void _handleOptionTapped(int optionIndex) {
    setState(() {
      if (touchedOptionIndex == optionIndex) {
        // Si ya estaba tocada, se selecciona
        selectedOptionIndex = optionIndex;
        touchedOptionIndex = -1; // Resetea el estado de tocada
      } else {
        // Si no estaba tocada, marca como tocada
        touchedOptionIndex = optionIndex;
      }
    });
  }

//** ----------------------------------------------------------------------------*

//** ----------AL FINAL DEL TEST MOSTRAMOS UN RESULTADO-------------------------------

  Widget resultadoALert(BuildContext context) {
    int porcentaje = ((test1Preguntas.right / totaldePreguntas) * 100).toInt();
    int numPreguntas = totaldePreguntas;

    return AlertDialog(
      title: const Text('Resultado', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
      backgroundColor: const Color.fromRGBO(249, 245, 229, 1.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Preguntas  :  ' '${test1Preguntas}'),
          Text('Correctas   :  ' '${test1Preguntas.right}',
              style: const TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold)),
          Text(
              'Incorrectas:  '
              '${(totaldePreguntas - test1Preguntas.right)}',
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
                  builder: ((context) =>
                      ResultadoTest(questionario: test1Preguntas, numPreguntas: numPreguntas, porcentaje: porcentaje)),
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

  void _mostrarResultadoFinal() {
    // Verificar si ambos tests han terminado
    if (test1Index == test1Preguntas.preguntas.length - 1 && test2Index == test2Preguntas.preguntas.length - 1) {
      String ganador;
      if (test1RightAnswers > test2RightAnswers) {
        ganador = "¡El jugador 1 ganó!";
      } else if (test1RightAnswers < test2RightAnswers) {
        ganador = "¡El jugador 2 ganó!";
      } else {
        ganador = "¡Es un empate!";
      }

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Resultado Final",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Jugador 1: $test1RightAnswers respuestas correctas"),
                Text("Jugador 2: $test2RightAnswers respuestas correctas"),
                const SizedBox(height: 10),
                Text(
                  ganador,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const Homepage(),
                    ),
                  );
                },
                child: const Text("Volver al inicio"),
              ),
            ],
          );
        },
      );
    }
  }

//** ----------------------------------------------------------------*

  //* -----------------BLOQUES para la INTERFAZ---------------------
  Widget _buildTestCard({
    required Questionario testPreguntas,
    required int testIndex,
    required bool mostrarRespuestas,
    required Function() toggleMostrarRespuestas,
    required Function(String) onOptionSelected,
    required bool terminado,
  }) {
    return Column(
      children: [
        if (terminado)
          const Center(
            child: Text(
              "Esperando...",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.red),
            ),
          )
        else
          // Pregunta (o ícono '?')
          GestureDetector(
            onTap: toggleMostrarRespuestas, // Alternar entre pregunta y respuestas
            child: Container(
              margin: const EdgeInsets.only(
                top: 5,
                bottom: 0,
                left: 18,
                right: 18,
              ),
              child: Card(
                color: const Color.fromRGBO(250, 235, 215, 1.0),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 1, // Margen superior
                    bottom: 0,
                    left: 18,
                    right: 18,
                  ),
                  child: Center(
                    child: mostrarRespuestas
                        ? // Progreso
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 2),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Separar elementos
                                children: [
                                  Expanded(
                                    flex: 4, // Espacio proporcional para el progreso
                                    child: LinearProgressIndicator(
                                      color: Colors.amber[700],
                                      backgroundColor: const Color(0xFFD9D9D9),
                                      value: (testIndex + 1) / testPreguntas.preguntas.length,
                                      minHeight: 20,
                                    ),
                                  ),
                                  const SizedBox(width: 10), // Espaciado entre progreso e ícono
                                  const Icon(
                                    Icons.help_outline, // Ícono '?'
                                    size: 24,
                                    color: Colors.black54,
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Text(
                            testPreguntas.preguntas[testIndex].pregunta,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ),
        // Respuestas (se muestran si `mostrarRespuestas` es true)
        if (mostrarRespuestas && !terminado)
          Flexible(
            child: ListView.builder(
              itemCount: totalOptions,
              itemBuilder: (_, index) {
                return Container(
                  margin: const EdgeInsets.all(6),
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black87),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListTile(
                    title: AutoSizeText(
                      testPreguntas.preguntas[testIndex].options[index],
                      maxLines: 2, // Máximo de líneas permitidas para el texto
                      minFontSize: 11, // Tamaño mínimo del texto
                      maxFontSize: 16, // Tamaño máximo del texto
                      overflow: TextOverflow.ellipsis, // Añade "..." si el texto se recorta
                      style: const TextStyle(fontWeight: FontWeight.w400),
                    ),
                    onTap: () {
                      onOptionSelected(testPreguntas.preguntas[testIndex].options[index]);
                    },
                  ),
                );
              },
            ),
          ),
      ],
    );
  }

//* -----------------CREACIÓN DE LA INTERFAZ---------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 245, 229, 1.0),
      body: Column(
        children: [
          // Test volteado (Test 1)
          Expanded(
            flex: 1,
            child: Transform.rotate(
              angle: 3.14159, // Rotación 180°
              child: _buildTestCard(
                testPreguntas: test1Preguntas,
                testIndex: test1Index,
                mostrarRespuestas: mostrarRespuestasTest1,
                toggleMostrarRespuestas: () {
                  setState(() {
                    mostrarRespuestasTest1 = !mostrarRespuestasTest1;
                  });
                },
                terminado: test1Terminado,
                onOptionSelected: _handleOptionSelectedTest1,
              ),
            ),
          ),

          // Espaciador entre tests
          const Divider(
            color: Colors.black45,
            height: 1,
            thickness: 1,
          ),

          // Barra de control
          Container(
            color: Colors.amber[200],
            height: 15,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 15,
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.arrow_back, color: Colors.black87),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),

          // Test normal (Test 2)
          Expanded(
            flex: 1,
            child: _buildTestCard(
              testPreguntas: test2Preguntas,
              testIndex: test2Index,
              mostrarRespuestas: mostrarRespuestasTest2,
              toggleMostrarRespuestas: () {
                setState(() {
                  mostrarRespuestasTest2 = !mostrarRespuestasTest2;
                });
              },
              terminado: test2Terminado,
              onOptionSelected: _handleOptionSelectedTest2,
            ),
          ),
        ],
      ),
    );
  }
}
