import 'package:cat_bombers/pages/test_rapido.dart';
import 'package:cat_bombers/pages/home_page.dart';
import 'package:cat_bombers/pages/menu_test.dart';
import 'package:cat_bombers/pages/perfil.dart';
import 'package:cat_bombers/classes/Questionario.dart';
import 'package:cat_bombers/pages/select_num_preguntas.dart';
import 'package:cat_bombers/pages/Fallos_Questionario.dart';
import 'package:cat_bombers/pages/base.dart';
import 'package:cat_bombers/pages/seleccionar_temas.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Questionario quizFails;
    return MaterialApp(
        title: 'Cat-Bombers',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(249, 245, 229, 1.0),
          textTheme: TextTheme(
            headline1: TextStyle(
              color: Colors.black87,
            ),
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const Homepage(),
          '/ruta-para-test_rapido': (context) => const FasterQuiz(0),
          '/ruta-para-test_fallades': (context) => Fallos_Questionario(
              0, Questionario(name: 'Test Fallades', preguntas: [])),
          '/ruta-para-menu_test': (context) => const MenuTest(),
          '/ruta-para-stats_usuario': (context) => const ReviewQuiz(),
          '/ruta-para-perfil': (context) => const Perfil_user(),
          '/ruta-para-select_num_preguntas': (context) =>
              const Number_questions(false),
          '/ruta-para-seleccionar_temes': (context) => const SelectTheme(),
        });
  }
}
