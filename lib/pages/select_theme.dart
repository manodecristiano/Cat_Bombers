import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SelectTheme extends StatelessWidget {
  const SelectTheme({super.key});

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
                      'Selecciona Tema',
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
                    Navigator.pushNamed(context, '/hidraulica');
                  },
                  child: const AutoSizeText(
                    'Hidráulica',
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
                    Navigator.pushNamed(context, '/electricidad');
                  },
                  child: const AutoSizeText(
                    'Electricitat',
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
                    Navigator.pushNamed(context, '/constitucion');
                  },
                  child: const AutoSizeText(
                    'Constitució',
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
                    Navigator.pushNamed(context, '/contruccion');
                  },
                  child: const AutoSizeText(
                    'Construcció',
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
