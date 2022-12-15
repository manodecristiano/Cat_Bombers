import 'package:auto_size_text/auto_size_text.dart';
import 'package:cat_bombers/classes/question.dart';
import 'package:cat_bombers/classes/quiz.dart';
import 'package:cat_bombers/pages/home_page.dart';
import 'package:cat_bombers/pages/result_quiz.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Perfil_user extends StatefulWidget {
  const Perfil_user({super.key});

  @override
  State<Perfil_user> createState() => _Perfil_user();
}

class _Perfil_user extends State<Perfil_user> {
  Quiz quiz = Quiz(name: 'Perfil', questions: []);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 245, 229, 1.0),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black87,
        ),
        title: AutoSizeText(
          quiz.name,
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        elevation: 5,
        backgroundColor: Colors.amber[200],
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 450),
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
              child: Column(children: [
                SizedBox(
                  height: 250.0,
                  width: 340,
                  child: Image.asset('assets/img/bombers.png'),
                )
              ]),
            )),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 450),
          child: PieChart(
            PieChartData(
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 0,
                centerSpaceRadius: 0,
                sections: sectionsChart),
          ),
        ),
      ]),
    );
  }

  List<PieChartSectionData> sectionsChart = [
    PieChartSectionData(
      value: 35,
      title: "35%",
      showTitle: true,
      color: Colors.orange,
      radius: 100,
    ),
    PieChartSectionData(
      value: 45,
      title: "45%",
      showTitle: true,
      color: Colors.blue,
      radius: 100,
    ),
    PieChartSectionData(
      value: 15,
      title: "15%",
      showTitle: true,
      color: Colors.red,
      radius: 100,
    ),
    PieChartSectionData(
      value: 5,
      title: "5%",
      showTitle: true,
      color: Colors.purple,
      radius: 100,
    ),
  ];
}
