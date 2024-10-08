import 'package:auto_size_text/auto_size_text.dart';
import 'package:cat_bombers/classes/Pregunta.dart';
import 'package:cat_bombers/classes/Questionario.dart';
import 'package:cat_bombers/pages/test_rapido.dart';
import 'package:cat_bombers/pages/home_page.dart';
import 'package:cat_bombers/pages/resultado_test.dart';
//import 'package:flutter/src/widgets/container.dart';
//import 'package:flutter/src/widgets/framework.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'Fallos_Questionario.dart';

class NumberQuestions extends StatelessWidget {
  final bool fallades;
  const NumberQuestions(this.fallades, {super.key});

  Widget _buildErrorDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Hurra!',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
      backgroundColor: const Color.fromRGBO(249, 245, 229, 1.0),
      content: const Text('No tens suficients preguntes fallades  '),
      actions: [
        TextButton(
            onPressed: () {
            //^-----NAVEGAR HACIA ATRáS
              Navigator.of(context).pop();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                  builder: ((context) => const Homepage()),
                  ));
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black87),
          ),
          child: const Text('Tancar'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 245, 229, 1.0),
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
              style: const TextStyle(
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
            color: const Color.fromRGBO(249, 240, 229, 1.0),
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
                const Divider(),
                OutlinedButton(
                  onPressed: () {
                    debugPrint('-------DENTRO DE select_num_preguntas------');
                    debugPrint(
                        'Numero de preguntas falladas=> ${questionariodeFalladas.preguntas.length}');
                    if (fallades == false) {
                      debugPrint('fallades=false');
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const FasterQuiz(10)),
                          ));
                    } else {
                      if (questionariodeFalladas.preguntas.length < 10) {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) =>
                                _buildErrorDialog(context));
                      } else {
                        debugPrint('fallades=true');
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => FallosQuestionario(
                                  10, questionariodeFalladas)),
                            ));
                      }
                    }
                  },
                 
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(249, 245, 229, 1.0),
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    elevation: 5,
                    side: const BorderSide(width: 0.2),
                  ),
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
                ),
                const Divider(),
                OutlinedButton(
                  onPressed: () {
                    if (fallades == false) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const FasterQuiz(20)),
                          ));
                    } else {
                      if (questionariodeFalladas.preguntas.length < 20) {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) =>
                                _buildErrorDialog(context));
                      } else {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => FallosQuestionario(
                                  10, questionariodeFalladas)),
                            ));
                      }
                    }
                  },
               
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(249, 245, 229, 1.0),
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    elevation: 5,
                    side: const BorderSide(width: 0.2),
                  ),
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
                ),
                const Divider(),
                OutlinedButton(
                  onPressed: () {
                    if (fallades == false) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const FasterQuiz(30)),
                          ));
                    } else {
                      if (questionariodeFalladas.preguntas.length < 30) {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) =>
                                _buildErrorDialog(context));
                      } else {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => FallosQuestionario(
                                  10, questionariodeFalladas)),
                            ));
                      }
                    }
                  },
               
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(249, 245, 229, 1.0),
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    elevation: 5,
                    side: const BorderSide(width: 0.2),
                  ),
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
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
