import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:flutter/services.dart';

class ReviewQuiz extends StatefulWidget {
  const ReviewQuiz({super.key});

  @override
  State<ReviewQuiz> createState() => _ReviewQuizState();
}

class _ReviewQuizState extends State<ReviewQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 245, 229, 1.0),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black87,
        ),
        title: AutoSizeText(
          'Estadísticas',
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        elevation: 5,
        backgroundColor: Colors.amber[200],
      ),
      body: Center(child: Text('Review Page')),
    );
  }
}
