import 'package:auto_size_text/auto_size_text.dart';
import 'package:cat_bombers/classes/question.dart';
import 'package:cat_bombers/classes/quiz.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FasterQuiz extends StatefulWidget {
  const FasterQuiz({super.key});

  @override
  State<FasterQuiz> createState() => _FasterQuizState();
}

class _FasterQuizState extends State<FasterQuiz> {
  int totalQuestions = 5;
  int totalOptions = 4;
  int questionIndex = 0;
  int progressBar = 1;
  Quiz quiz = Quiz(name: 'Test Rápido', questions: []);

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/paises.json');
    final List<dynamic> data = await json.decode(response);
    List<int> optionList = List<int>.generate(data.length, (i) => i);
    List<int> questionAdded = [];

    while (true) {
      optionList.shuffle();
      int correctAnswer = optionList[0];
      if (questionAdded.contains(correctAnswer)) continue;
      questionAdded.add(correctAnswer);

      List<String> otherOptions = [];
      for (var option in optionList.sublist(1, totalOptions)) {
        otherOptions.add(data[option]['capital']);
      }

      Question question = Question.fromJson(data[correctAnswer]);
      question.addOptions(otherOptions);
      quiz.questions.add(question);
      if (quiz.questions.length >= totalQuestions) break;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  void _optionSelected(String userSelected) {
//Marcar como opción correcta si es la recogida en el Json
    quiz.questions[questionIndex].selected = userSelected;
    if (userSelected == quiz.questions[questionIndex].correctAnswer) {
      print('correct');
      quiz.questions[questionIndex].correct = true;
//Aumentamnos el valor total de correctas
      quiz.right += 1;
    } else {
      print('NO correct');
    }

//Siguiente pregunta y recarga la pantalla
    if (questionIndex < totalQuestions - 1) {
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
          style:
              TextStyle(color: Colors.amber[700], fontWeight: FontWeight.bold)),
      backgroundColor: Color.fromRGBO(249, 245, 229, 1.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Preguntas  :  ' '$totalQuestions'),
          Text('Correctas   :  ' '${quiz.right}',
              style: TextStyle(
                  color: Colors.greenAccent, fontWeight: FontWeight.bold)),
          Text('Incorrectas:  ' '${(totalQuestions - quiz.right)}',
              style: TextStyle(
                  color: Colors.redAccent, fontWeight: FontWeight.bold)),
          Text('Porcentaje :  ' '${quiz.percent}%'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cerrar'),
        ),
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
          quiz.name,
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
            child: quiz.questions.isNotEmpty
                ? Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: AutoSizeText(
                            quiz.questions[questionIndex].question,
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
                      quiz.questions[questionIndex].options[index]),
                  onTap: () {
                    _optionSelected(
                        quiz.questions[questionIndex].options[index]);
                  },
                ),
              );
            },
          ),
        ),
        TextButton(
          onPressed: () {
            _optionSelected('Skipped');
          },
          child: const Text('Skip'),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: LinearProgressIndicator(
              color: Colors.amber[700],
              backgroundColor: const Color(0xFFD9D9D9),
              value: progressBar / totalQuestions,
              minHeight: 20,
            ),
          ),
        ),
      ]),
    );
  }
}
