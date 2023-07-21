import 'dart:ffi';
import 'package:cat_bombers/pages/menu_test.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cat_bombers/classes/question.dart';
import 'package:cat_bombers/classes/quiz.dart';
import 'package:cat_bombers/pages/home_page.dart';
import 'package:cat_bombers/pages/resultado_test.dart';
import 'package:cat_bombers/pages/test_rapido.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FailedsQuiz extends StatefulWidget {
  final int totalQuestions;
  final Quiz quizFails;
  const FailedsQuiz(this.totalQuestions, this.quizFails, {super.key});

  @override
  State<FailedsQuiz> createState() => _FailedsQuizState();
}

class _FailedsQuizState extends State<FailedsQuiz> {
  int totalOptions = 4;
  int questionIndex = 0;
  int progressBar = 1;
  int cuantasquedan = 0;
  String country = '';

  Quiz ListCorrects = Quiz(name: 'Test Fallades', questions: []);

  @override
  void initState() {
    crearfalsoQuiz();
    super.initState();

    cuantasquedan = widget.totalQuestions;
  }

  void crearfalsoQuiz() {
    Question question1 = Question.fromJson({
      'country': 'pais 1',
      'capital': 'Correcta',
    });
    question1.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    quizFails.questions.add(question1);

    Question question2 = Question.fromJson({
      'country': 'pais 2',
      'capital': 'Correcta',
    });
    question2.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    quizFails.questions.add(question2);

    Question question3 = Question.fromJson({
      'country': 'pais 3',
      'capital': 'Correcta',
    });
    question3.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    quizFails.questions.add(question3);

    Question question4 = Question.fromJson({
      'country': 'pais 4',
      'capital': 'Correcta',
    });
    question4.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    quizFails.questions.add(question4);

    Question question5 = Question.fromJson({
      'country': 'pais 5',
      'capital': 'Correcta',
    });
    question5.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    quizFails.questions.add(question5);

    Question question6 = Question.fromJson({
      'country': 'pais 6',
      'capital': 'Correcta',
    });
    question6.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    quizFails.questions.add(question6);

    Question question7 = Question.fromJson({
      'country': 'pais 7',
      'capital': 'Correcta',
    });
    question7.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    quizFails.questions.add(question7);

    Question question8 = Question.fromJson({
      'country': 'pais 8',
      'capital': 'Correcta',
    });
    question8.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    quizFails.questions.add(question8);

    Question question9 = Question.fromJson({
      'country': 'pais 9',
      'capital': 'Correcta',
    });
    question9.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    quizFails.questions.add(question9);

    Question question11 = Question.fromJson({
      'country': 'pais 11',
      'capital': 'Correcta',
    });
    question11.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    quizFails.questions.add(question11);

    Question question10 = Question.fromJson({
      'country': 'pais 10',
      'capital': 'Correcta',
    });
    question10.addOptions(['Incorrecta', 'Incorrecta', 'Incorrecta']);
    quizFails.questions.add(question10);
  }

  void _optionSelected(String userSelected) {
//Marcar como opción correcta si es la recogida en el Json
    quizFails.questions[questionIndex].selected = userSelected;
    if (userSelected == quizFails.questions[questionIndex].correctAnswer) {
      print('correct');
      quizFails.questions[questionIndex].correct = true;
//Aumentamnos el valor total de correctas
      quizFails.right += 1;
      ListCorrects.questions.add(quizFails.questions[questionIndex]);
      // quizFails.questions.removeAt(questionIndex);
//       // widget.quizFails.questions
//       // .remove(quizFails.questions[questionIndex].question);
      // for (int i = 0; i <= widget.quizFails.questions.length - 1; i++) {
      //   print(
      //       'for de quizFails=>${questionIndex++} -->${quizFails.questions[i].country}-->${quizFails.questions[i].correctAnswer}');
      // }
    } else {
      print('NO correct');
    }

    print('questionIndex=> ${questionIndex}');
    print('totalQuestions=> ${widget.totalQuestions}');

//Siguiente pregunta y recarga la pantalla
    if (questionIndex < widget.totalQuestions - 1) {
      questionIndex += 1;
      cuantasquedan -= 1;
    } else {
      for (int i = 0; i <= widget.quizFails.questions.length - 1; i++) {
        country = quizFails.questions[i].country;

        for (int j = 0; j <= ListCorrects.questions.length - 1; j++) {
          if (country == ListCorrects.questions[i].country) {
            print('ELIMINAMOS DUPLICADO');
            quizFails.questions.removeAt(i);
          }
        }
      }
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => _buildResultDialog(context));
    }
    progressBar += 1;

    setState(() {});
    print('cuantasquedan=> ${cuantasquedan}');
  }

//   void _optionSelected(String userSelected) {

//     //quizFailsCorrects = quizFails;
//     // widget.quizFails.questions[questionIndex].selected = userSelected;

// //Marcar como opción correcta si es la recogida en el Json
//     if (userSelected ==
//         widget.quizFails.questions[questionIndex].correctAnswer) {
//       print('correct');
//       print('Acertaste-->${quizFails.questions[questionIndex].question}');

//       widget.quizFails.questions[questionIndex].correct = true;
// //Aumentamnos el valor total de correctas
//       widget.quizFails.right += 1;
// //Quitamos del array de Fails
//       print(
//           'quitamos de quizFails el INDEX-->${questionIndex} -- ${quizFails.questions[questionIndex].question}');
//       quizFails.questions.removeAt(questionIndex);
//       // widget.quizFails.questions
//       // .remove(quizFails.questions[questionIndex].question);

//       for (int i = 0; i <= widget.quizFails.questions.length - 1; i++) {
//         print(
//             'for de quizFails=>${questionIndex++} -->${quizFails.questions[i].country}-->${quizFails.questions[i].correctAnswer}');
//       }

//       print(
//           'quitamos de quizFails DESPUES-->${questionIndex}--${quizFails.questions[questionIndex - 1].question}');
//     } else {
//       print('NO correct');
//     }

// //Siguiente pregunta y recarga la pantalla
//     if (questionIndex < widget.totalQuestions - 1) {
//       questionIndex += 1;
//     } else {
//       print('ELIMINAMOS DUPLICADOS');
//       //Eliminamos DUPLICADOS
//       // for (Quiz pregunta in widget.quizFailsCorrects) {
//       //   if (quizFails.contains(pregunta)) {
//       //   quizFails.remove(pregunta);
//       //  }
//       //  }

//       for (int i = 0; i <= quizFailsCorrects.questions.length - 1; i++) {
//         print(
//             'for de quizREFails=>${questionIndex} -->${quizFails.questions[i].country}-->${quizFails.questions[i].correctAnswer}');
//       }
//       showDialog(
//           barrierDismissible: false,
//           context: context,
//           builder: (BuildContext context) => _buildResultDialog(context));
//     }
//     progressBar += 1;

//     setState(() {});
//   }

//
//
//
////
//
//
////
//
//
//
  Widget _buildResultDialog(BuildContext context) {
    return AlertDialog(
      title: Text('Resultado',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
      backgroundColor: Color.fromRGBO(249, 245, 229, 1.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Preguntas  :  ' '${widget.totalQuestions}'),
          Text('Correctas   :  ' '${widget.quizFails.right}',
              style: TextStyle(
                  color: Colors.greenAccent, fontWeight: FontWeight.bold)),
          Text(
              'Incorrectas:  '
              '${(widget.totalQuestions - widget.quizFails.right)}',
              style: TextStyle(
                  color: Colors.redAccent, fontWeight: FontWeight.bold)),
          Text('Porcentaje :  '
              '${widget.quizFails.percent.toStringAsFixed(2)}%'),
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
                  builder: ((context) => ResultQuiz(quiz: widget.quizFails)),
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
          widget.quizFails.name,
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
            child: widget.quizFails.questions.isNotEmpty
                ? Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: AutoSizeText(
                            //PETA AQUI
                            widget.quizFails.questions[questionIndex].question,
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
                      widget.quizFails.questions[questionIndex].options[index]),
                  onTap: () {
                    _optionSelected(widget
                        .quizFails.questions[questionIndex].options[index]);
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
              value: progressBar / widget.totalQuestions,
              minHeight: 20,
            ),
          ),
        ),
      ]),
    );
  }
}
