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
  int totaldePreguntas = 15;
  bool mostrarRespuestasTest1 = false;
  bool mostrarRespuestasTest2 = false;

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
        'pregunta':
            "¿Quina de les següents propietats de l'aigua és una bona qualitat per extingir incendis,Quina de les següents propietats de l'aigua és una bona qualitat per extingir incendis?",
        'respuesta': "L'aigua pura no conduiex l'electricitat  és una bona qualitat per extingir"
      }),
      Pregunta.fromJson(
          {'id': 1, 'categoria': 'Electricitat', 'pregunta': 'España es el mejor país?', 'respuesta': 'Correcta'}),
      Pregunta.fromJson({'id': 2, 'categoria': 'Hidráulica', 'pregunta': 'Donde vives?', 'respuesta': 'Correcta'}),
      Pregunta.fromJson(
          {'id': 3, 'categoria': 'Hidráulica', 'pregunta': 'Cuántas estrellas existen?', 'respuesta': 'Correcta'}),
      Pregunta.fromJson(
          {'id': 4, 'categoria': 'Hidráulica', 'pregunta': 'Después del 4 viene el...?', 'respuesta': 'Correcta'}),
      Pregunta.fromJson(
          {'id': 5, 'categoria': 'Electricitat', 'pregunta': '5 por el culo...?', 'respuesta': 'Correcta'}),
      Pregunta.fromJson(
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
          {'id': 19, 'categoria': 'Hidráulica', 'pregunta': 'Tu actor favorito?', 'respuesta': 'Correcta'}),
    ];

    for (var pregunta in listaPreguntas) {
      // Asegúrate de que las opciones estén inicializadas
      pregunta.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);

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
      }
    });
  }

//** ----------------------------------------------------------------------------*

//** ----------AL FINAL DEL TEST MOSTRAMOS UN RESULTADO-------------------------------

  /*  Widget resultadoALert(BuildContext context) {
    int porcentaje = ((todasLasPreguntas.right / totaldePreguntas) * 100).toInt();
    int numPreguntas = totaldePreguntas;

    return AlertDialog(
      title: const Text('Resultado', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
      backgroundColor: const Color.fromRGBO(249, 245, 229, 1.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Preguntas  :  ' '${totaldePreguntas}'),
          Text('Correctas   :  ' '${todasLasPreguntas.right}',
              style: const TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold)),
          Text(
              'Incorrectas:  '
              '${(totaldePreguntas - todasLasPreguntas.right)}',
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
  } */

//** ----------------------------------------------------------------*

//* -----------------CREACIÓN DE LA INTERFAZ---------------------

  /*  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 245, 229, 1.0),
      body: Column(
        children: [
          // Test volteado
          Expanded(
            flex: 1,
            child: Transform.rotate(
              angle: 3.14159, // Rotación de 180 grados (π en radianes)
              child: _buildTestCard(volteado: true),
            ),
          ),

          // Espacio entre los tests
          const Divider(
            color: Colors.black45,
            height: 1,
            thickness: 1,
          ),
          Container(
            color: Colors.amber[200],
            height: 15, // Altura ajustada para mayor visibilidad
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center, // Centra verticalmente
              children: [
                IconButton(
                  iconSize: 15, 
                  padding: EdgeInsets.zero,// Tamaño del icono
                  icon: const Icon(Icons.arrow_back, color: Colors.black87),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
          // Test normal
          Expanded(
            flex: 1,
            child: _buildTestCard(volteado: false),
          ),
        ],
      ),
    );
  }

// Método para construir el diseño del test
  Widget _buildTestCard({required bool volteado}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 200),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
            child: todasLasPreguntas.preguntas.isNotEmpty
                ? Card(
                    color:
                        volteado ? const Color.fromRGBO(250, 235, 215, 1.0) : const Color.fromRGBO(255, 245, 220, 1.0),
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
                            todasLasPreguntas.preguntas[questionIndex].pregunta,
                            minFontSize: 16,
                            maxFontSize: 35,
                            style: TextStyle(
                              color:
                                  volteado ? const Color.fromRGBO(70, 70, 70, 1) : const Color.fromRGBO(0, 0, 0, 0.8),
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
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: LinearProgressIndicator(
              color: Colors.amber[700],
              backgroundColor: const Color(0xFFD9D9D9),
              value: (questionIndex + 1) / totaldePreguntas,
              minHeight: 20,
            ),
          ),
        ),
      ],
    );
  }
}
 */
/* 
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
                progress: test1Progress,
                totalRight: test1RightAnswers,
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
              progress: test2Progress,
              totalRight: test2RightAnswers,
              onOptionSelected: _handleOptionSelectedTest2,
            ),
          ),
        ],
      ),
    );
  }
 */
  Widget _buildTestCard({
    required Questionario testPreguntas,
    required int testIndex,
    required bool mostrarRespuestas,
    required Function() toggleMostrarRespuestas,
    required Function(String) onOptionSelected,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Pregunta
        GestureDetector(
          onTap: toggleMostrarRespuestas, // Alternar entre pregunta y respuestas
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 200),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
              child: Card(
                color: const Color.fromRGBO(250, 235, 215, 1.0),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Center(
                    child: Text(
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
        ),

        // Respuestas (se muestran si `mostrarRespuestas` es true)
        if (mostrarRespuestas)
          Flexible(
            child: ListView.builder(
              itemCount: testPreguntas.preguntas[testIndex].options.length,
              itemBuilder: (_, index) {
                return ListTile(
                  title: Text(testPreguntas.preguntas[testIndex].options[index]),
                  onTap: () => onOptionSelected(testPreguntas.preguntas[testIndex].options[index]),
                );
              },
            ),
          ),

        // Progreso
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: LinearProgressIndicator(
            value: (testIndex + 1) / testPreguntas.preguntas.length,
          ),
        ),
      ],
    );
  }

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
              onOptionSelected: _handleOptionSelectedTest2,
            ),
          ),
        ],
      ),
    );
  }
}

  /* Widget _buildTestCard({
    required Questionario testPreguntas,
    required int testIndex,
    required int progress,
    required int totalRight,
    required Function(String) onOptionSelected,
  }) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 450),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
          child: testPreguntas.preguntas.isNotEmpty
            /  ? Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(2),
                        child: AutoSizeText(
                          testPreguntas.preguntas[testIndex].pregunta,
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
                title: AutoSizeText(testPreguntas.preguntas[testIndex].options[index]),
                onTap: () {
                  onOptionSelected(testPreguntas.preguntas[testIndex].options[index]);
                },
              ),
            );
          },
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: LinearProgressIndicator(
            color: Colors.amber[700],
            backgroundColor: const Color(0xFFD9D9D9),
            value: progress / testPreguntas.preguntas.length,
            minHeight: 20,
          ),
        ),
      ),
    ]);
  }
} */

        // Pregunta
       /*  ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 200),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
            child: testPreguntas.preguntas.isNotEmpty
                /? Card(
                    color: const Color.fromRGBO(250, 235, 215, 1.0),
                    child: Column(
                      children: [
                        Text(
                          testPreguntas.preguntas[testIndex].pregunta,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                : const CircularProgressIndicator(),
          ),
        ),

        // Opciones
        Flexible(
          child: ListView.builder(
            itemCount: totalOptions,
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(testPreguntas.preguntas[testIndex].options[index]),
                onTap: () => onOptionSelected(testPreguntas.preguntas[testIndex].options[index]),
              );
            },
          ),
        ),

        // Progreso
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: LinearProgressIndicator(
            value: progress / testPreguntas.preguntas.length,
          ),
        ),
      ],
    );
  }
}
 */