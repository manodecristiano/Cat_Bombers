import 'dart:ffi';
import 'package:cat_bombers/pages/menu_test.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cat_bombers/classes/Pregunta.dart';
import 'package:cat_bombers/classes/Questionario.dart';
import 'package:cat_bombers/pages/home_page.dart';
import 'package:cat_bombers/pages/resultado_test.dart';
import 'package:cat_bombers/pages/test_rapido.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Fallos_Questionario extends StatefulWidget {
  final int totalPreguntas;
  final Questionario questionariodeFallos;
  const Fallos_Questionario(this.totalPreguntas, this.questionariodeFallos,
      {super.key});

  @override
  State<Fallos_Questionario> createState() => _Fallos_QuestionarioState();
}

class _Fallos_QuestionarioState extends State<Fallos_Questionario> {
  int totalOptions = 4;
  int questionIndex = 0;
  int progressBar = 1;
  int cuantasquedan = 0;
  String country = '';

  Questionario ListREFails =
      Questionario(name: 'Lista de Re-Fallades', preguntas: []);

  Questionario ListCorrects =
      Questionario(name: 'Lista de Salvades', preguntas: []);

  @override
  void initState() {
    super.initState();

    cuantasquedan = widget.totalPreguntas;
  }

  void _optionSelected(String userSelected) {
//Marcar como opción correcta si es la recogida en el Json
    questionariodeFalladas.preguntas[questionIndex].selected = userSelected;
    if (userSelected ==
        questionariodeFalladas.preguntas[questionIndex].correctAnswer) {
      print('SI CORRECTA');
      questionariodeFalladas.preguntas[questionIndex].correct = true;
//Aumentamnos el valor total de correctas
      questionariodeFalladas.right += 1;
      ListCorrects.preguntas
          .add(questionariodeFalladas.preguntas[questionIndex]);
    } else {
      ListREFails.preguntas
          .add(questionariodeFalladas.preguntas[questionIndex]);
      print('NO correct');
    }

    print('questionIndex=> ${questionIndex}');
    print('totalQuestions=> ${widget.totalPreguntas}');

//Siguiente pregunta y recarga la pantalla
    if (questionIndex < widget.totalPreguntas - 1) {
      questionIndex += 1;
      cuantasquedan -= 1;
    } else {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => _buildResultDialog(context));
    }
    progressBar += 1;

    setState(() {});
    print('cuantasquedan=> ${cuantasquedan}');
  }

  void eliminarDuplicados(quizFails, ListCorrects, ListREFails) {
    if (widget.questionariodeFallos.preguntas.length == 0) {
      print('TODAS ACERTADAS');
    } else {
      List<Pregunta> preguntasNoDuplicadas = [];

      for (int i = 0; i < widget.questionariodeFallos.preguntas.length; i++) {
        country = quizFails.preguntas[i].country;
        print('COUNTRY quizFails-->${country}');
        bool esDuplicado = false;
        for (int j = 0; j < ListCorrects.preguntas.length; j++) {
          if (country == ListCorrects.preguntas[j].country) {
            print(
                'COUNTRY ListCorrects es DUPLICADO-->${ListCorrects.preguntas[j].country}');
            esDuplicado = true;
            break;
          }
        }

        if (!esDuplicado) {
          print('AÑADIMOS-->${country}');
          preguntasNoDuplicadas.add(widget.questionariodeFallos.preguntas[i]);
        }
      }

      // Ahora reemplaza la lista quizFails.preguntas con las preguntas no duplicadas.
      quizFails.preguntas = preguntasNoDuplicadas;
    }
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
          Text('Preguntas  :  ' '${widget.totalPreguntas}'),
          Text('Correctas   :  ' '${widget.questionariodeFallos.right}',
              style: TextStyle(
                  color: Colors.greenAccent, fontWeight: FontWeight.bold)),
          Text(
              'Incorrectas:  '
              '${(widget.totalPreguntas - widget.questionariodeFallos.right)}',
              style: TextStyle(
                  color: Colors.redAccent, fontWeight: FontWeight.bold)),
          Text('Porcentaje :  '
              '${widget.questionariodeFallos.percent.toStringAsFixed(2)}%'),
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
                      ResultQuiz(questionario: widget.questionariodeFallos)),
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
              eliminarDuplicados(
                  questionariodeFalladas, ListCorrects, ListREFails);
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
          widget.questionariodeFallos.name,
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
            child: widget.questionariodeFallos.preguntas.isNotEmpty
                ? Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: AutoSizeText(
                            //PETA AQUI
                            widget.questionariodeFallos.preguntas[questionIndex]
                                .pregunta,
                            minFontSize: 16,
                            maxFontSize: 35,
                            style: TextStyle(
                              color: Colors.redAccent,
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
                  title: AutoSizeText(widget.questionariodeFallos
                      .preguntas[questionIndex].options[index]),
                  onTap: () {
                    _optionSelected(widget.questionariodeFallos
                        .preguntas[questionIndex].options[index]);
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
              value: progressBar / widget.totalPreguntas,
              minHeight: 20,
            ),
          ),
        ),
      ]),
    );
  }
}
