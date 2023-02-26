import 'package:cat_bombers/pages/test_rapido.dart';
import 'package:cat_bombers/pages/home_page.dart';
import 'package:cat_bombers/pages/menu_test.dart';
import 'package:cat_bombers/pages/perfil.dart';
import 'package:cat_bombers/pages/select_number_test.dart';
import 'package:cat_bombers/pages/test_fallades.dart';
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
          '/ruta-para-menu_test': (context) => const MenuTest(),
          '/ruta-para-stats_usuario': (context) => const ReviewQuiz(),
          '/ruta-para-perfil': (context) => const Perfil_user(),
          '/ruta-para-select_number_test': (context) =>
              const Number_questions(),
          '/ruta-para-seleccionar_temes': (context) => const SelectTheme(),
          '/ruta-para-test_fallades': (context) => const Test_Fallades(),
        });
  }
}
