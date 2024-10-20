import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:cat_bombers/pages/test_rapido.dart';

class MenuTest extends StatelessWidget {
  const MenuTest({super.key});
 
  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      backgroundColor: const Color(0xFFF9F5E5),

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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: const Color.fromRGBO(249, 240, 229, 1.0),
            child: ListView(
              shrinkWrap: true,
              children: [

/**
 ** -----------------TITULO-----------------------------------------------------
**/
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

/**
 **-----------------------------------------------------------------------------
**/               

                const Divider(),
/**
 ** ----------------------BOTON 1 SIMULACRE--------------------------------------
**/
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const TestRapido(35)),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(239, 71, 111, 1.0),
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    elevation: 8,
                    side: const BorderSide(width: 0.2),
                  ),
                  child: const AutoSizeText(
                    'SIMULACRE',
                    style: TextStyle(
                      color:
                          Color.fromARGB(255, 226, 209, 209), // Use a more descriptive color name
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                    maxLines: 1,
                    minFontSize: 20,
                    maxFontSize: 100,
                  ),
                ),
/**
 **---------------------------------------------------------------------------
**/

                const Divider(),


/**
 ** -----------------------BOTON 2 LLUITA-------------------------------------
**/
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/ruta-para-crear_test');
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xFFF9F5E5),
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    elevation: 8,
                    side: const BorderSide(width: 0.2),
                  ),
                  child: const AutoSizeText(
                    'LLUITA',
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
 **-----------------------------------------------------------------------------
**/

                const Divider(),


/**
 ** ------------------------BOTON 3 PER TEMES------------------------------------
**/
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, '/ruta-para-seleccionar_temes');
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xFFF9F5E5),
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    elevation: 8,
                    side: const BorderSide(width: 0.2),
                  ),
                  child: const AutoSizeText(
                    'PER TEMES',
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                    minFontSize: 20,
                    maxFontSize: 100,
                  ),
                ),
/**
 **----------------------------------------------------------------------------
**/


                const Divider(),


/**
 ** -----------------------BOTON 4 TEST FALLADES----------------------------------
**/
                // This part is the same as the part below but with 'arguments'
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/ruta-para-select_num_preguntas',
                      arguments: true,
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xFFF9F5E5),
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    elevation: 8,
                    side: const BorderSide(width: 0.2),
                  ),
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
                ),
/**
 ** --------------------------------------------------------------------
**/
              ],
            ),
          ),
/**
 *?----------------------------------------------------------------------
**/

        ]),
      ),
    );
  }
}
