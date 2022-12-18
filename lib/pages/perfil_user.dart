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
      body: Center(
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              color: Color.fromRGBO(249, 240, 229, 1.0),
              margin:
                  const EdgeInsets.only(left: 2, right: 2, top: 2, bottom: 10),
            ),
            AutoSizeText('NIVEL: 57',
                minFontSize: 25,
                maxFontSize: 35,
                style: TextStyle(
                    color: Colors.brown, fontWeight: FontWeight.bold)),
            Text('Nombre : Carlos Messi',
                style: TextStyle(color: Colors.brown)),
            Text('Test Realizados:85'),
            Text('Total de preguntas: 345'),
            Expanded(
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
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> sectionsChart = [
    PieChartSectionData(
      value: 4.5,
      title: "Hidráulica",
      showTitle: true,
      color: Colors.orange,
      radius: 100,
    ),
    PieChartSectionData(
      value: 4.5,
      title: "Automoción",
      showTitle: true,
      color: Colors.blue,
      radius: 100,
    ),
    PieChartSectionData(
      value: 4.5,
      title: "Electricidad",
      showTitle: true,
      color: Colors.red,
      radius: 100,
    ),
    PieChartSectionData(
      value: 4.5,
      title: "Fuego",
      showTitle: true,
      color: Colors.purple,
      radius: 100,
    ),
    PieChartSectionData(
      value: 4.5,
      title: "Constitució",
      showTitle: true,
      color: Colors.orange,
      radius: 100,
    ),
    PieChartSectionData(
      value: 4.5,
      title: "Igualdad",
      showTitle: true,
      color: Colors.blue,
      radius: 100,
    ),
    PieChartSectionData(
      value: 4.5,
      title: "Estatut",
      showTitle: true,
      color: Colors.purple,
      radius: 100,
    ),
    PieChartSectionData(
      value: 4.5,
      title: "Mecánica",
      showTitle: true,
      color: Colors.orange,
      radius: 100,
    ),
    PieChartSectionData(
      value: 4.5,
      title: "Construcció",
      showTitle: true,
      color: Colors.blue,
      radius: 100,
    ),
    PieChartSectionData(
      value: 4.5,
      title: "Química",
      showTitle: true,
      color: Colors.red,
      radius: 100,
    ),
    PieChartSectionData(
      value: 4.5,
      title: "Ley 5/1994",
      showTitle: true,
      color: Colors.purple,
      radius: 100,
    ),
    PieChartSectionData(
      value: 4.5,
      title: "R.Químic",
      showTitle: true,
      color: Colors.orange,
      radius: 100,
    ),
    PieChartSectionData(
      value: 4.5,
      title: "Trebep",
      showTitle: true,
      color: Colors.blue,
      radius: 100,
    ),
    PieChartSectionData(
      value: 4.5,
      title: "Sanitari",
      showTitle: true,
      color: Colors.red,
      radius: 100,
    ),
    PieChartSectionData(
      value: 4.5,
      title: "R.Laborales",
      showTitle: true,
      color: Colors.purple,
      radius: 100,
    ),
    PieChartSectionData(
      value: 4.5,
      title: "R.Químic",
      showTitle: true,
      color: Colors.orange,
      radius: 100,
    ),
    PieChartSectionData(
      value: 4.5,
      title: "Estructura",
      showTitle: true,
      color: Colors.blue,
      radius: 100,
    ),
    PieChartSectionData(
      value: 4.5,
      title: "Física",
      showTitle: true,
      color: Colors.red,
      radius: 100,
    ),
    PieChartSectionData(
      value: 4.5,
      title: "Meteorologia",
      showTitle: true,
      color: Colors.purple,
      radius: 100,
    ),
    PieChartSectionData(
      value: 4.5,
      title: "P.Civil",
      showTitle: true,
      color: Colors.black26,
      radius: 100,
    ),
    PieChartSectionData(
      value: 4.5,
      title: "A.Extintores",
      showTitle: true,
      color: Colors.orange,
      radius: 100,
    ),
    PieChartSectionData(
      value: 4.5,
      title: "Cartografia",
      showTitle: true,
      color: Colors.blue,
      radius: 100,
    ),
    PieChartSectionData(
      value: 4.5,
      title: "P.Incendios",
      showTitle: true,
      color: Colors.red,
      radius: 100,
    ),
    PieChartSectionData(
      value: 4.5,
      title: "Guardia",
      showTitle: true,
      color: Colors.purple,
      radius: 100,
    ),
    PieChartSectionData(
      value: 4.5,
      title: "Gas",
      showTitle: true,
      color: Colors.red,
      radius: 100,
    ),
    PieChartSectionData(
      value: 4.5,
      title: "Territori",
      showTitle: true,
      color: Colors.purple,
      radius: 100,
    ),
  ];
}
