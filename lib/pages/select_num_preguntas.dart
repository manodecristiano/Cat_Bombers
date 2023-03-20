import 'package:auto_size_text/auto_size_text.dart';
import 'package:cat_bombers/classes/question.dart';
import 'package:cat_bombers/classes/quiz.dart';
import 'package:cat_bombers/pages/test_rapido.dart';
import 'package:cat_bombers/pages/home_page.dart';
import 'package:cat_bombers/pages/resultado_test.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Test_Fallades.dart';

class Number_questions extends StatelessWidget {
  final bool fallades;
  const Number_questions(this.fallades, {super.key});

  Widget _buildErrorDialog(BuildContext context) {
    for (int i = 0; i <= quizFails.questions.length - 1; i++) {
      print('for de quizFails=>${quizFails.questions[i].country}');
    }
    return AlertDialog(
      title: Text('Hurra!',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
      backgroundColor: Color.fromRGBO(249, 245, 229, 1.0),
      content: Text('No tens suficients preguntes fallades  '),
      actions: [
        TextButton(
            child: Text('Tancar'),
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
      // appBar: AppBar(
      //   elevation: 5,
      //   backgroundColor: Colors.amber[200],
      // ),
      body: Center(
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(
              top: 30,
            ),
            // ignore: prefer_const_constructors
            child: AutoSizeText(
              'Cat-BOMBERS',
              style: TextStyle(
                color: Color.fromRGBO(236, 194, 44, 1.0),
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
              maxLines: 1,
              minFontSize: 48,
              maxFontSize: 100,
            ),
          ),
          Card(
            margin: const EdgeInsets.all(30),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: Color.fromRGBO(249, 240, 229, 1.0),
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              children: [
                Container(
                  height: 50,
                  margin: const EdgeInsets.only(top: 10),
                  child: const Center(
                    child: AutoSizeText(
                      'Selecciona el número de preguntas',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                      maxLines: 1,
                      minFontSize: 18,
                      maxFontSize: 100,
                    ),
                  ),
                ),
                Divider(),
                OutlinedButton(
                  onPressed: () {
                    if (fallades == false) {
                      print('fallades=false');
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => FasterQuiz(10)),
                          ));
                    } else {
                      if (quizFails.questions.length < 10) {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) =>
                                _buildErrorDialog(context));
                      } else {
                        print('fallades=true');
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: ((context) =>
                                  FailedsQuiz(10, quizFails)),
                            ));
                      }
                    }
                  },
                  child: const AutoSizeText(
                    '10',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                    maxLines: 1,
                    minFontSize: 20,
                    maxFontSize: 100,
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(249, 245, 229, 1.0),
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    elevation: 5,
                    side: const BorderSide(width: 0.2),
                  ),
                ),
                Divider(),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => FasterQuiz(20)),
                        ));
                  },
                  child: const AutoSizeText(
                    '20',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                    maxLines: 1,
                    minFontSize: 20,
                    maxFontSize: 100,
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(249, 245, 229, 1.0),
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    elevation: 5,
                    side: const BorderSide(width: 0.2),
                  ),
                ),
                Divider(),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => FasterQuiz(30)),
                        ));
                  },
                  child: const AutoSizeText(
                    '30',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                    maxLines: 1,
                    minFontSize: 20,
                    maxFontSize: 100,
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(249, 245, 229, 1.0),
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    elevation: 5,
                    side: const BorderSide(width: 0.2),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
