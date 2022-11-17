import 'package:cat_bombers/pages/faster_quiz.dart';
import 'package:cat_bombers/pages/home_page.dart';
import 'package:cat_bombers/pages/statistics_user.dart';
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
          '/quiz-page': (context) => const FasterQuiz(),
          '/statistics-user': (context) => const ReviewQuiz(),
        });
  }
}
