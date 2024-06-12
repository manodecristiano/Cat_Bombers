import 'package:auto_size_text/auto_size_text.dart';
import 'package:cat_bombers/classes/Pregunta.dart';
import 'package:cat_bombers/classes/Questionario.dart';
import 'package:cat_bombers/pages/home_page.dart';
import 'package:cat_bombers/pages/resultado_test.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Questionario questionariodeFalladas =
    Questionario(name: 'Test Fallades', preguntas: []);

class FasterQuiz extends StatefulWidget {
  final int totaldePreguntas;
  const FasterQuiz(this.totaldePreguntas, {super.key});

  @override
  State<FasterQuiz> createState() => _FasterQuizState();
}

class _FasterQuizState extends State<FasterQuiz> {
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
  //       otherOptions.add(data[option]['capital']);
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
      'country': 'pais 0',
      'capital': 'Correcta',
    });
    pregunta0.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(pregunta0);

    Pregunta question1 = Pregunta.fromJson({
      'country': 'pais 1',
      'capital': 'Correcta',
    });
    question1.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question1);

    Pregunta question2 = Pregunta.fromJson({
      'country': 'pais 2',
      'capital': 'Correcta',
    });
    question2.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question2);

    Pregunta question3 = Pregunta.fromJson({
      'country': 'pais 3',
      'capital': 'Correcta',
    });
    question3.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question3);

    Pregunta question4 = Pregunta.fromJson({
      'country': 'pais 4',
      'capital': 'Correcta',
    });
    question4.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question4);

    Pregunta question5 = Pregunta.fromJson({
      'country': 'pais 5',
      'capital': 'Correcta',
    });
    question5.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question5);

    Pregunta question6 = Pregunta.fromJson({
      'country': 'pais 6',
      'capital': 'Correcta',
    });
    question6.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question6);

    Pregunta question7 = Pregunta.fromJson({
      'country': 'pais 7',
      'capital': 'Correcta',
    });
    question7.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question7);

    Pregunta question8 = Pregunta.fromJson({
      'country': 'pais 8',
      'capital': 'Correcta',
    });
    question8.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question8);

    Pregunta question9 = Pregunta.fromJson({
      'country': 'pais 9',
      'capital': 'Correcta',
    });
    question9.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question9);

    Pregunta question10 = Pregunta.fromJson({
      'country': 'pais 10',
      'capital': 'Correcta',
    });
    question10.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    questionario.preguntas.add(question10);
/*
    Question question11 = Question.fromJson({
      'country': 'pais 11',
      'capital': 'Correcta',
    });
    question11.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    quiz.questions.add(question11);

    Question question12 = Question.fromJson({
      'country': 'pais 12',
      'capital': 'Correcta',
    });
    question12.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    quiz.questions.add(question12);

    Question question13 = Question.fromJson({
      'country': 'pais 13',
      'capital': 'Correcta',
    });
    question13.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    quiz.questions.add(question13);

    Question question14 = Question.fromJson({
      'country': 'pais 14',
      'capital': 'Correcta',
    });
    question14.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    quiz.questions.add(question14);

    Question question15 = Question.fromJson({
      'country': 'pais 15',
      'capital': 'Correcta',
    });
    question15.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    quiz.questions.add(question15);

    Question question16 = Question.fromJson({
      'country': 'pais 16',
      'capital': 'Correcta',
    });
    question16.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    quiz.questions.add(question16);

    Question question17 = Question.fromJson({
      'country': 'pais 17',
      'capital': 'Correcta',
    });
    question17.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    quiz.questions.add(question17);

    Question question18 = Question.fromJson({
      'country': 'pais 18',
      'capital': 'Correcta',
    });
    question18.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    quiz.questions.add(question18);

    Question question19 = Question.fromJson({
      'country': 'pais 19',
      'capital': 'Correcta',
    });
    question19.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    quiz.questions.add(question19);

    Question question20 = Question.fromJson({
      'country': 'pais 20',
      'capital': 'Correcta',
    });
    question20.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    quiz.questions.add(question20);

    Question question21 = Question.fromJson({
      'country': 'pais 21',
      'capital': 'Correcta',
    });
    question21.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    quiz.questions.add(question21); */

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
    if (userSelected == questionario.preguntas[questionIndex].correctAnswer) {
      print('SI CORRECTA');
      questionario.preguntas[questionIndex].correct = true;
//Aumentamnos el valor total de correctas
      questionario.right += 1;
    } else {
      print('NO correct');
//añadimos a la lista de fallos
      questionariodeFalladas.preguntas
          .add(questionario.preguntas[questionIndex]);
      print(
          'añadida a quizFails=${questionario.preguntas[questionIndex].pregunta}');
    }

//Siguiente pregunta y recarga la pantalla
    if (questionIndex < widget.totaldePreguntas - 1) {
      questionIndex += 1;
    } else {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => _buildResultDialog(context));
    }
    progressBar += 1;

    setState(() {});
  }

  Widget _buildResultDialog(BuildContext context) {
    return AlertDialog(
      title: Text('Resultado',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
      backgroundColor: Color.fromRGBO(249, 245, 229, 1.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Preguntas  :  ' '${widget.totaldePreguntas}'),
          Text('Correctas   :  ' '${questionario.right}',
              style: TextStyle(
                  color: Colors.greenAccent, fontWeight: FontWeight.bold)),
          Text(
              'Incorrectas:  '
              '${(widget.totaldePreguntas - questionario.right)}',
              style: TextStyle(
                  color: Colors.redAccent, fontWeight: FontWeight.bold)),
          Text('Porcentaje :  ' '${questionario.percent.toInt()}%'),
        ],
      ),
      actions: [
        TextButton(
            child: Text('Ver respuestas'),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: ((context) =>
                      ResultQuiz(questionario: questionario)),
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black87),
            )),
        TextButton(
            child: Text('Cerrar'),
            onPressed: () {
              //NAVEGAR HACIA ATRáS
              Navigator.of(context).pop();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => Homepage()),
                  ));
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black87),
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 245, 229, 1.0),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black87,
        ),
        title: AutoSizeText(
          questionario.name,
          style: TextStyle(
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
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : const CircularProgressIndicator(
                    color: Colors.amber, backgroundColor: Colors.transparent),
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
                  title: AutoSizeText(
                      questionario.preguntas[questionIndex].options[index]),
                  onTap: () {
                    _optionSelected(
                        questionario.preguntas[questionIndex].options[index]);
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
          child: const Text('Pasar'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white70),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black45),
          ),
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
