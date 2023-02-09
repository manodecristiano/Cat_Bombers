// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cat_bombers/classes/question.dart';
import 'package:cat_bombers/classes/quiz.dart';
import 'package:cat_bombers/pages/home_page.dart';
import 'package:cat_bombers/pages/result_quiz.dart';
//import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pie_chart/pie_chart.dart';

class Perfil_user extends StatefulWidget {
  const Perfil_user({super.key});

  @override
  State<Perfil_user> createState() => _Perfil_user();
}

class PanelUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
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
        AutoSizeText('Xavier Chapie',
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
        AutoSizeText('Superados: 253',
            minFontSize: 10,
            maxFontSize: 35,
            style: TextStyle(
                color: Color.fromARGB(255, 206, 191, 185),
                fontWeight: FontWeight.bold))
      ],
    );
  }
}

class ImageUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset('assets/img/bomber01.png'),
    );
  }
}

class ImageFire extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset('assets/img/fire01.png'),
    );
  }
}

class _Perfil_user extends State<Perfil_user> {
  Quiz quiz = Quiz(name: 'Perfil', questions: []);

  MaterialButton ButtonchangeLista(String nombreBoton) {
    return MaterialButton(
      onPressed: () {
        if (nombreBoton == 'LLeis') {
          setState(() {
            list = dataMapTemaLey;
          });
        } else if (nombreBoton == 'Mecanic') {
          setState(() {
            list = dataMapTemesMecanics;
          });
        } else if (nombreBoton == 'Natural') {
          setState(() {
            list = dataMapTemasNaturalesa;
          });
        } // acción del botón
      },
      child: AutoSizeText(
        nombreBoton,
        style: TextStyle(
          color: Color.fromARGB(255, 247, 176, 110),
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto',
        ),
        maxLines: 1,
        minFontSize: 10,
        maxFontSize: 30,
      ),
    );
  }

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
              clipBehavior: Clip.antiAlias,
              width: 200,
              height: 250,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                // ignore: prefer_const_literals_to_create_immutables
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
                // ignore: prefer_const_literals_to_create_immutables
                boxShadow: [
                  // ignore: prefer_const_constructors
                  BoxShadow(
                    color: Color.fromARGB(255, 250, 146, 27),
                    blurRadius: 15.0,
                  )
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    height: 250,
                    width: 250,
                    left: -30,
                    child: ImageUser(),
                  ),
                  Positioned(
                    top: 140,
                    width: 180,
                    left: 200,
                    child: ImageFire(),
                  ),
                  Positioned(
                    top: 10,
                    width: 180,
                    left: 180,
                    child: PanelUser(),
                  ),
                ],
              ),
            ),
            Container(
                height: 45,
                width: 20,
                margin: EdgeInsets.only(left: 65, right: 65, bottom: 0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 250, 146, 27),
                      blurRadius: 5.0,
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
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)), // Radius of the border
                  border: Border.all(
                      width: 1.2, color: Color.fromARGB(255, 245, 187, 132)),
                ),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ButtonchangeLista('Mecanic'),
                    ButtonchangeLista('LLeis'),
                    ButtonchangeLista('Natural'),
                  ],
                )),
            Container(
              height: 250,
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 0),
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
                dataMap: list,
                animationDuration: Duration(milliseconds: 2000),
                chartLegendSpacing: 32,
                chartRadius: MediaQuery.of(context).size.width / 2.5,
                colorList: colorList,
                initialAngleInDegree: 0,
                chartType: ChartType.disc,
                ringStrokeWidth: 32,
                legendOptions: LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.right,
                  showLegends: true,
                  //legendShape: _BoxShape.circle,
                  legendTextStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.amber),
                ),
                chartValuesOptions: ChartValuesOptions(
                  chartValueBackgroundColor: Colors.amber,
                  chartValueStyle: TextStyle(color: Colors.amber),
                  showChartValueBackground: false,
                  showChartValues: true,
                  showChartValuesInPercentage: true,
                  showChartValuesOutside: true,
                  decimalPlaces: 0,
                ),
                // gradientList: ---To add gradient colors---
                // emptyColorGradient: ---Empty Color gradient---
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
              child: Row(
                children: [
                  GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    scrollDirection: Axis.horizontal,
                    children: List.generate(100, (index) {
                      return Center(
                        child: Text(
                          'Item 555',
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<IconData> iconsLogros = [
    Icons.star,
    Icons.favorite,
    Icons.thumb_up,
    Icons.thumb_down,
    Icons.comment
  ];

/*
     AutoSizeText(
                    'LOGROS',
                    textAlign: TextAlign.center,
                    minFontSize: 25,
                    maxFontSize: 35,
                    style: TextStyle(
                        color: Color.fromARGB(255, 245, 187, 132),
                        fontWeight: FontWeight.bold),
                  ),
  /*height: 100,
                      width: 100,
                      child: ListView.builder(
                        itemCount: iconsLogros.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Icon(iconsLogros[index]);
                        },
                      )*/ */
  Map<String, double> list = {
    "Constitució": 3,
    "Igualtat": 2,
    "Estatut": 2,
    "Lley 5/1994": 2,
    "Trebep": 3,
    "R.Laborales": 2,
    "D.Estructura": 5,
    "P.Civil": 2,
    "D.Guardia": 5,
  };

  Map<String, double> dataMapTemaLey = {
    "Constitució": 3,
    "Igualtat": 2,
    "Estatut": 2,
    "Lley 5/1994": 2,
    "Trebep": 3,
    "R.Laborales": 2,
    "D.Estructura": 5,
    "P.Civil": 2,
    "D.Guardia": 5,
  };
  Map<String, double> dataMapTemesMecanics = {
    "Automoció": 5,
    "Mecánica": 6,
    "Construcció": 3,
    "Química": 2,
    "R.Químic": 5,
    "Física": 3,
    "A.Extintores": 5,
    "P.Incendis": 2,
  };

  Map<String, double> dataMapTemasNaturalesa = {
    "Hidráulica": 1,
    "Gas": 3,
    "Electricitat": 5,
    "Foc": 2,
    "Sanitari": 1,
    "Territori": 0,
    "Meteorologia": 0,
    "Cartografia": 0,
  };
  final colorList = <Color>[
    Color.fromARGB(255, 87, 71, 23),
    Color.fromARGB(255, 128, 123, 108),
    Color.fromARGB(255, 138, 105, 7),
    Color.fromARGB(255, 31, 25, 6),
    Color.fromARGB(255, 228, 224, 30),
    Color.fromARGB(218, 179, 76, 8),
    Color.fromARGB(255, 145, 26, 5),
    Color.fromARGB(218, 240, 106, 17),
    Color.fromARGB(218, 77, 83, 15)
  ];
}
