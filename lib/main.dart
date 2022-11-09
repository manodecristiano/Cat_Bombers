import 'package:cat_bombers/pages/faster_quiz.dart';
import 'package:cat_bombers/pages/home_page.dart';
import 'package:cat_bombers/pages/review_quiz.dart';
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
        theme: ThemeData(primarySwatch: Colors.indigo),
        initialRoute: '/',
        routes: {
          '/': (context) => const Homepage(),
          '/quiz-page': (context) => const FasterQuiz(),
          '/review-page': (context) => const ReviewQuiz(),
        });
  }
}
