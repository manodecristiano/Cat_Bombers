import 'package:auto_size_text/auto_size_text.dart';
import 'package:cat_bombers/pages/select_num_preguntas.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cat_bombers/pages/test_rapido.dart';

class MenuTest extends StatelessWidget {
  const MenuTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 245, 229, 1.0),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black87,
        ),
        elevation: 0,
        backgroundColor: Color.fromRGBO(249, 245, 229, 1.0),
        title: AutoSizeText(
          'Cat-BOMBERS',
          style: TextStyle(
            color: Color.fromRGBO(236, 194, 44, 1.0),
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
          maxLines: 1,
          minFontSize: 38,
          maxFontSize: 38,
        ),
      ),
      body: Center(
        child: Column(children: [
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
                      'Menú Test',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                      maxLines: 1,
                      minFontSize: 40,
                      maxFontSize: 100,
                    ),
                  ),
                ),
                Divider(),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => FasterQuiz(35)),
                        ));
                  },
                  child: const AutoSizeText(
                    'SIMULACRE',
                    style: TextStyle(
                      color: Color.fromRGBO(249, 240, 229, 1.0),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                    maxLines: 1,
                    minFontSize: 20,
                    maxFontSize: 100,
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(239, 71, 111, 1.0),
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    elevation: 8,
                    side: const BorderSide(width: 0.2),
                  ),
                ),
                Divider(),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/ruta-para-crear_test');
                  },
                  child: const AutoSizeText(
                    'CREAR TEST',
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
                    elevation: 8,
                    side: const BorderSide(width: 0.2),
                  ),
                ),
                Divider(),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, '/ruta-para-seleccionar_temes');
                  },
                  child: const AutoSizeText(
                    'PER TEMES',
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
                    elevation: 8,
                    side: const BorderSide(width: 0.2),
                  ),
                ),
                Divider(),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => Number_questions(true)),
                        ));
                  },
                  child: const AutoSizeText(
                    'TEST FALLADES',
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
                    elevation: 8,
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
