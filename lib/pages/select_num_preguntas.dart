import 'package:auto_size_text/auto_size_text.dart';
import 'package:cat_bombers/pages/test_rapido.dart';
import 'package:cat_bombers/pages/menu_home.dart';
import 'package:flutter/material.dart';
import 'test_fallos.dart';

class SelectNumPreguntas extends StatelessWidget {
  const SelectNumPreguntas({super.key});

  @override
  Widget build(BuildContext context) {
    // Recupera el argumento pasado desde Navigator.pushNamed
    final Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final bool boolentroaFallades = args['boolentroaFallades'];
    final String tema = args['tema'];

    int falladas = questionariodeFalladas.preguntas.length;
    debugPrint('-------DENTRO DE select_num_preguntas------');
    debugPrint('Numero de preguntas falladas=> $falladas');
    debugPrint('boolentroaFallades==>$boolentroaFallades');

    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 245, 229, 1.0),

/**
 *todo ---------------------NAVBAR con TITULO APP---------------------------------------
**/
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black87),
        elevation: 0,
        backgroundColor: const Color(0xFFF9F5E5),
        title: const AutoSizeText(
          'Cat-BOMBERS',
          style: TextStyle(
            color: Colors.orangeAccent, // Use a more descriptive color name
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
                /**
 **-----------------------------------------------------------------------------
**/

                const Divider(),
                if (boolentroaFallades == true) ...[
/**
 ** -----------------ALERT de -10 PREGUNTAS-----------------------------------------------------
**/
                  if (falladas < 10) mensajeDeNOtenerFalladas(context),
/**
 ** -----------------BOTON 10 PREGUNTAS-----------------------------------------------------
**/
                  if (falladas >= 10) ...[contructordeBotones(context, 10, boolentroaFallades, ''), const Divider()],
/**
 ** -----------------BOTON 20 PREGUNTAS-----------------------------------------------------
**/
                  if (falladas >= 20) ...[contructordeBotones(context, 20, boolentroaFallades, ''), const Divider()],
/**
 ** -----------------BOTON 30 PREGUNTAS-----------------------------------------------------
**/
                  if (falladas >= 30) contructordeBotones(context, 30, boolentroaFallades, ''),
                ] else ...[
                  contructordeBotones(context, 10, boolentroaFallades, tema),
                  const Divider(),
                  contructordeBotones(context, 20, boolentroaFallades, tema),
                  const Divider(),
                  contructordeBotones(context, 30, boolentroaFallades, tema),
                ],
              ],
            ),
          ),
/**
 *?-----------------------------------------------------------------------------------------------
**/
        ]),
      ),
    );
  }

//^^ Función que crea los botones dinámicamente--------------------------------------------------
  Widget contructordeBotones(BuildContext context, int numPreguntas, bool boolentroaFallades, String tema) {
    return OutlinedButton(
      onPressed: () {
        if (boolentroaFallades == false) {
          if (tema != '') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: ((context) => TestRapido(numPreguntas, tema)),
              ),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: ((context) => TestRapido(numPreguntas, '')),
              ),
            );
          }
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: ((context) => TestFallos(numPreguntas, questionariodeFalladas)),
            ),
          );
        }
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(249, 245, 229, 1.0),
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
        elevation: 5,
        side: const BorderSide(width: 0.2),
      ),
      child: AutoSizeText(
        '$numPreguntas',
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto',
        ),
        maxLines: 1,
        minFontSize: 20,
        maxFontSize: 100,
      ),
    );
  }
}
//^^-----------------------------------------------------------------------------------------------

//^^Funcion que crea un Alert si NO hay suficientes preguntas falladas-----------------
Widget mensajeDeNOtenerFalladas(BuildContext context) {
  return AlertDialog(
    title: const Text('Hurra!', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
    backgroundColor: const Color.fromRGBO(249, 245, 229, 1.0),
    content: const Text('No tienes suficientes preguntas falladas.'),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: ((context) => const Homepage())),
          );
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
//^^-----------------------------------------------------------------------------------------------

