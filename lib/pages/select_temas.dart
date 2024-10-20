import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/container.dart';
//import 'package:flutter/src/widgets/framework.dart';

class SelectTheme extends StatelessWidget {
  const SelectTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 245, 229, 1.0),

/**
 *todo ---------------------NAVBAR con TITULO APP---------------------------------------
**/
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Icono de flecha hacia atrás
          onPressed: () {
            Navigator.pop(context); // Navega hacia atrás
          },
        ),
        iconTheme: const IconThemeData(
          color: Colors.black87,
        ),
        elevation: 0,
        backgroundColor: const Color.fromRGBO(249, 245, 229, 1.0),
        title: const AutoSizeText(
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
/**
 *todo ----------------------------------------------------------------------------------
**/

      body: Center(
        child: Column(children: [
/**
 *?-----------------------DIV QUE ENGLOBA TODOS LOS BOTONES------------------------------
**/
          Card(
            margin: const EdgeInsets.all(30),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: const Color.fromRGBO(249, 240, 229, 1.0),
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              children: [
/**
 ** -----------------TITULO-----------------------------------------------------
**/
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
/**
 **-----------------------------------------------------------------------------
**/

                const Divider(),

/**
 ** ----------------------BOTON 1 HYDRAULICA--------------------------------------
**/

                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/ruta-para-select_num_preguntas',
                      arguments: {'boolentroaFallades': false, 'tema': 'hidraulica'},
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(249, 245, 229, 1.0),
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    elevation: 8,
                    side: const BorderSide(width: 0.2),
                  ),
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
                ),
                const Divider(),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/electricidad');
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(249, 245, 229, 1.0),
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    elevation: 8,
                    side: const BorderSide(width: 0.2),
                  ),
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
                ),
                const Divider(),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/constitucion');
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(249, 245, 229, 1.0),
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    elevation: 8,
                    side: const BorderSide(width: 0.2),
                  ),
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
                ),
                const Divider(),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/contruccion');
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(249, 245, 229, 1.0),
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    elevation: 8,
                    side: const BorderSide(width: 0.2),
                  ),
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
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
