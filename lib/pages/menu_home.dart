import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:cat_bombers/pages/test_rapido.dart';
import 'dart:math'; // Importa la clase Random
/* import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart'; */

class Homepage extends StatelessWidget {
  const Homepage({super.key});

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
/**
 *todo -----------------------TITULO APP----------------------------------
**/
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
/**
 *todo------------------------------------------------------------
**/

/**
 *?-----------------------DIV QUE ENGLOBA TODOS LOS BOTONES----------------------------------
**/
          Card(
            margin: const EdgeInsets.all(30),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: const Color.fromRGBO(249, 240, 229, 1.0),
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              children: [
/**
 ** -----------------------TITULO PÁGINA------------------------------------
**/
                Container(
                  height: 50,
                  margin: const EdgeInsets.only(top: 10),
                  child: const Center(
                    child: AutoSizeText(
                      'Menú',
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
 ** -------------------------------------------------------------------------
**/


                const Divider(),

/**
 ** -----------------------BOTON TEST RAPIDO----------------------------------
**/

                OutlinedButton(
                  onPressed: () {
                    // Genera un número aleatorio entre 10, 15 y 20
                    final List<int> posiblesPreguntas = [10, 15, 20];
                    final random = Random();
                    final numeroPreguntas = posiblesPreguntas[random.nextInt(posiblesPreguntas.length)];

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => TestRapido(numeroPreguntas)),
                        ));
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(239, 222, 150, 1.0),
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    elevation: 8,
                    side: const BorderSide(width: 0.2),
                  ),
                  child: const AutoSizeText(
                    'TEST RÁPID',
                    style: TextStyle(
                      color: Color.fromRGBO(239, 71, 111, 1.0),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                    maxLines: 1,
                    minFontSize: 20,
                    maxFontSize: 100,
                  ),
                ),

/**
 ** -----------------------------------------------------------------------
**/


                const Divider(),

/**
 ** -----------------------BOTON MENU TEST----------------------------------
**/

                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/ruta-para-menu_test');
                  },
                 
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(249, 245, 229, 1.0),
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    elevation: 8,
                    side: const BorderSide(width: 0.2),
                  ),
                  child: const AutoSizeText(
                    'MENÚ TEST',
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

/**
 ** ----------------------------------------------------------------------
**/



                const Divider(),



/**
 ** -----------------------BOTON PERFIL----------------------------------
**/
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/ruta-para-perfil');
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(249, 245, 229, 1.0),
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    elevation: 8,
                    side: const BorderSide(width: 0.2),
                  ),
                  child: const AutoSizeText(
                    'PERFIL',
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
/**
 ** -----------------------------------------------------------------------
**/


                const Divider(),



/**
 ** -----------------------BOTON OPCIONESS----------------------------------
**/

                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/ruta-para-opciones');
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(249, 245, 229, 1.0),
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    elevation: 8,
                    side: const BorderSide(width: 0.2),
                  ),
                  child: const AutoSizeText(
                    'OPCIONS',
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

/**
 ** -----------------------------------------------------------------------
**/
              ],
            ),
          ),
/**
 *? -----------------------------------------------------------------------
**/

/**
 ** -----------------------IMAGEN PORTADA----------------------------------
**/
          Card(
            child: Column(children: [
              SizedBox(
                height: 230.0,
                width: 340,
                child: Image.asset(
                  'assets/img/bombers.png',
                  fit: BoxFit.cover,
                ),
                
              )
            ]),
          ),
/**
 ** ----------------------------------------------------------------------
**/


        ]),
      ),
    );
  }
}

