// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cat_bombers/classes/question.dart';
import 'package:cat_bombers/classes/quiz.dart';
import 'package:cat_bombers/pages/home_page.dart';
import 'package:cat_bombers/pages/result_quiz.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/rendering.dart';
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
      backgroundColor: Color.fromARGB(186, 43, 40, 46),
      appBar: AppBar(
        // ignore: prefer_const_constructors
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
        child: ListView(
          children: [
            Container(
              height: 250,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                // ignore: prefer_const_literals_to_create_immutables
                boxShadow: [
                  // ignore: prefer_const_constructors
                  BoxShadow(
                    color: Color.fromARGB(255, 250, 146, 27),
                    blurRadius: 25.0,
                  )
                ],
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color.fromARGB(255, 148, 86, 16),
                    Color.fromARGB(255, 12, 8, 2),
                  ],
                ), // Color of the container
                borderRadius:
                    BorderRadius.circular(20.0), // Radius of the border
                border: Border.all(
                    width: 2, color: Color.fromARGB(255, 247, 176, 110)),
              ),
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(20.0),
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  AutoSizeText('NIVELL: 57',
                      minFontSize: 25,
                      maxFontSize: 35,
                      style: TextStyle(
                          color: Color.fromARGB(255, 248, 242, 163),
                          fontWeight: FontWeight.bold)),
                  AutoSizeText('Carlos Carreño',
                      minFontSize: 20,
                      maxFontSize: 35,
                      style: TextStyle(
                          color: Color.fromARGB(255, 206, 191, 185),
                          fontWeight: FontWeight.bold)),
                  AutoSizeText('Test realizados: 345',
                      minFontSize: 15,
                      maxFontSize: 35,
                      style: TextStyle(
                          color: Color.fromARGB(255, 206, 191, 185),
                          fontWeight: FontWeight.bold)),
                  AutoSizeText('Preguntas:',
                      minFontSize: 10,
                      maxFontSize: 35,
                      style: TextStyle(
                          color: Color.fromARGB(255, 206, 191, 185),
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Container(
              height: 250,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 250, 146, 27),
                    blurRadius: 15.0,
                  )
                ],
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color.fromARGB(255, 66, 39, 7),
                    Color.fromARGB(255, 0, 0, 0),
                  ],
                ), // Color of the container
                borderRadius:
                    BorderRadius.circular(60.0), // Radius of the border
                border: Border.all(
                    width: 1.2, color: Color.fromARGB(255, 245, 187, 132)),
              ),
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
            Container(
              height: 250,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 250, 146, 27),
                    blurRadius: 15.0,
                  )
                ],
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color.fromARGB(255, 66, 39, 7),
                    Color.fromARGB(255, 0, 0, 0),
                  ],
                ), // Color of the container
                borderRadius:
                    BorderRadius.circular(60.0), // Radius of the border
                border: Border.all(
                    width: 1.2, color: Color.fromARGB(255, 245, 187, 132)),
              ),
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
            Container(
              alignment: Alignment.center,
              height: 250,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 250, 146, 27),
                    blurRadius: 15.0,
                  )
                ],
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color.fromARGB(255, 66, 39, 7),
                    Color.fromARGB(255, 0, 0, 0),
                  ],
                ), // Color of the container
                borderRadius:
                    BorderRadius.circular(60.0), // Radius of the border
                border: Border.all(
                    width: 1.2, color: Color.fromARGB(255, 245, 187, 132)),
              ),
              child: AutoSizeText('LOGROS ',
                  minFontSize: 25,
                  maxFontSize: 35,
                  style: TextStyle(
                      color: Color.fromARGB(255, 248, 242, 163),
                      fontWeight: FontWeight.bold)),
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
