import 'package:auto_size_text/auto_size_text.dart';
import 'package:cat_bombers/classes/Pregunta.dart';
import 'package:cat_bombers/classes/Questionario.dart';
import 'package:cat_bombers/pages/menu_home.dart';
import 'package:cat_bombers/pages/resultado_test.dart';
import 'package:flutter/material.dart';

Questionario questionariodeFalladas = Questionario(name: 'Test Fallades', preguntas: []);

class TestRapido extends StatefulWidget {
  final int totaldePreguntas;
  const TestRapido(this.totaldePreguntas, {super.key});

  @override
  State<TestRapido> createState() => _TestRapido();
}

class _TestRapido extends State<TestRapido> {
  int totalOptions = 4;
  int questionIndex = 0;
  int progressBar = 1;

  Questionario questionario = Questionario(name: 'Test Rápid', preguntas: []);

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

  Future<void> crearfalsoQuiz() async {
    Pregunta pregunta0 = Pregunta.fromJson({
      'pregunta': '0; De que color es el caballo blanco?',
      'respuesta': 'Correcta',
    });
    pregunta0.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(pregunta0);

    Pregunta question1 = Pregunta.fromJson({
      'pregunta': '1; respuesta de España?',
      'respuesta': 'Correcta',
    });
    question1.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question1);

    Pregunta question2 = Pregunta.fromJson({
      'pregunta': '2; Donde vives?',
      'respuesta': 'Correcta',
    });
    question2.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question2);

    Pregunta question3 = Pregunta.fromJson({
      'pregunta': '3; Cuantas estrellas existen?',
      'respuesta': 'Correcta',
    });
    question3.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question3);

    Pregunta question4 = Pregunta.fromJson({
      'pregunta': '4; Después del 4 viene el...?',
      'respuesta': 'Correcta',
    });
    question4.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question4);

    Pregunta question5 = Pregunta.fromJson({
      'pregunta': '5; 5 por el culo...',
      'respuesta': 'Correcta',
    });
    question5.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question5);

    Pregunta question6 = Pregunta.fromJson({
      'pregunta': '6; Helicoptero lleva H ?',
      'respuesta': 'Correcta',
    });
    question6.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question6);

    Pregunta question7 = Pregunta.fromJson({
      'pregunta': '7; Mil, tres ,uno que cosas tienen en común?',
      'respuesta': 'Correcta',
    });
    question7.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question7);

    Pregunta question8 = Pregunta.fromJson({
      'pregunta': '8; Tailandia es un país?',
      'respuesta': 'Correcta',
    });
    question8.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question8);

    Pregunta question9 = Pregunta.fromJson({
      'pregunta': '9; 1988 el mejor año?',
      'respuesta': 'Correcta',
    });
    question9.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question9);

    Pregunta question10 = Pregunta.fromJson({
      'pregunta': '10; Acabarás la app?',
      'respuesta': 'Correcta',
    });
    question10.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question10);

    Pregunta question11 = Pregunta.fromJson({
      'pregunta': '11; respuesta de Puertorico?',
      'respuesta': 'Correcta',
    });
    question11.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question11);

    Pregunta question12 = Pregunta.fromJson({
      'pregunta': '12; Donde naciste?',
      'respuesta': 'Correcta',
    });
    question12.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question12);

    Pregunta question13 = Pregunta.fromJson({
      'pregunta': '13; Cuantas pecas tienes?',
      'respuesta': 'Correcta',
    });
    question13.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question13);

    Pregunta question14 = Pregunta.fromJson({
      'pregunta': '14; Provincias de España?',
      'respuesta': 'Correcta',
    });
    question14.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question14);

    Pregunta question15 = Pregunta.fromJson({
      'pregunta': '15; Tu número favorito',
      'respuesta': 'Correcta',
    });
    question15.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question15);

    Pregunta question16 = Pregunta.fromJson({
      'pregunta': '16; Cuantos son 2+2?',
      'respuesta': 'Correcta',
    });
    question16.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question16);

    Pregunta question17 = Pregunta.fromJson({
      'pregunta': '17; Error 500 significa...?',
      'respuesta': 'Correcta',
    });
    question17.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question17);

    Pregunta question18 = Pregunta.fromJson({
      'pregunta': '18; De color es el verde?',
      'respuesta': 'Correcta',
    });
    question18.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question18);

    Pregunta question19 = Pregunta.fromJson({
      'pregunta': '19; Tu actor favorito?',
      'respuesta': 'Correcta',
    });
    question19.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question19);

    Pregunta question20 = Pregunta.fromJson({
      'pregunta': '20; Te gusta la app?',
      'respuesta': 'Correcta',
    });
    question20.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question20);

    Pregunta question21 = Pregunta.fromJson({
      'pregunta': '21; Nombre de tu mascota?',
      'respuesta': 'Correcta',
    });
    question21.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question21);

    Pregunta question22 = Pregunta.fromJson({
      'pregunta': '22; Cuántos días tiene una semana?',
      'respuesta': 'Correcta',
    });
    question22.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question22);

    Pregunta question23 = Pregunta.fromJson({
      'pregunta': '23; respuesta de Australia?',
      'respuesta': 'Correcta',
    });
    question23.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question23);

    Pregunta question24 = Pregunta.fromJson({
      'pregunta': '24; Qué año estamos?',
      'respuesta': 'Correcta',
    });
    question24.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question24);

    Pregunta question25 = Pregunta.fromJson({
      'pregunta': '25; Cuántos planetas hay en el sistema solar?',
      'respuesta': 'Correcta',
    });
    question25.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question25);

    Pregunta question26 = Pregunta.fromJson({
      'pregunta': '26; Cuánto es 10 por 10?',
      'respuesta': 'Correcta',
    });
    question26.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question26);

    Pregunta question27 = Pregunta.fromJson({
      'pregunta': '27; Cuántas patas tiene un perro?',
      'respuesta': 'Correcta',
    });
    question27.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question27);

    Pregunta question28 = Pregunta.fromJson({
      'pregunta': '28; En qué continente está España?',
      'respuesta': 'Correcta',
    });
    question28.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question28);

    Pregunta question29 = Pregunta.fromJson({
      'pregunta': '29; Cuántos huesos tiene un adulto?',
      'respuesta': 'Correcta',
    });
    question29.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question29);

    Pregunta question30 = Pregunta.fromJson({
      'pregunta': '30; Cuál es tu comida favorita?',
      'respuesta': 'Correcta',
    });
    question30.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question30);

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    //readJson();
    crearfalsoQuiz();
  }

  void _optionSelected(String userSelected) {
//Marcar como opción correcta si es la recogida en el Json
    questionario.preguntas[questionIndex].selected = userSelected;
    if (userSelected == questionario.preguntas[questionIndex].respuesta) {
      debugPrint('SI CORRECTA');
      questionario.preguntas[questionIndex].correct = true;
//Aumentamnos el valor total de correctas
      questionario.right += 1;
    } else {
      debugPrint('NO correct');
//añadimos a la lista de fallos
      questionariodeFalladas.preguntas.add(questionario.preguntas[questionIndex]);
      debugPrint('añadida a quizFails=${questionario.preguntas[questionIndex].pregunta}');
    }

//Siguiente pregunta y recarga la pantalla
    if (questionIndex < widget.totaldePreguntas - 1) {
      questionIndex += 1;
    } else {
      showDialog(
          barrierDismissible: false, context: context, builder: (BuildContext context) => resultadoALert(context));
    }
    progressBar += 1;

    setState(() {});
  }

  Widget resultadoALert(BuildContext context) {
    int porcentaje = ((questionario.right / widget.totaldePreguntas) * 100).toInt();
    int numPreguntas = widget.totaldePreguntas;

    return AlertDialog(
      title: const Text('Resultado', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
      backgroundColor: const Color.fromRGBO(249, 245, 229, 1.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Preguntas  :  ' '${widget.totaldePreguntas}'),
          Text('Correctas   :  ' '${questionario.right}',
              style: const TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold)),
          Text(
              'Incorrectas:  '
              '${(widget.totaldePreguntas - questionario.right)}',
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
                      ResultadoTest(questionario: questionario, numPreguntas: numPreguntas, porcentaje: porcentaje)),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 245, 229, 1.0),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black87,
        ),
        title: AutoSizeText(
          questionario.name,
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
            child: questionario.preguntas.isNotEmpty
                ? Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: AutoSizeText(
                            questionario.preguntas[questionIndex].pregunta,
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
                  title: AutoSizeText(questionario.preguntas[questionIndex].options[index]),
                  onTap: () {
                    _optionSelected(questionario.preguntas[questionIndex].options[index]);
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
              value: progressBar / widget.totaldePreguntas,
              minHeight: 20,
            ),
          ),
        ),
      ]),
    );
  }
}
