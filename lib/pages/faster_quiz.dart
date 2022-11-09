import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class FasterQuiz extends StatefulWidget {
  const FasterQuiz({super.key});

  @override
  State<FasterQuiz> createState() => _FasterQuizState();
}

class _FasterQuizState extends State<FasterQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 245, 229, 1.0),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black87,
        ),
        title: const AutoSizeText(
          'Test rápido',
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
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: AutoSizeText(
                      'Loremum d dolororo um doloror sumLoremum d dolororo ipsuum doloror asum d ipsum dolor ipsuum doloror sumdolor ipsuum doloror sum dolor ipor sum dolor ipor sum dolor ipor sum dolor ipdolor ipor sum dolor ip dolor sum dolor ipipsLoremum dolor ipsum dolor sum dolor ipipsLoremm dolor sum dolor ipipsLorem ipsum dolor ipsum dolor sum dolor ipipsLorem ipsum dolor ipsum dolor sum dolor ipips',
                      minFontSize: 16,
                      maxFontSize: 35,
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Flexible(
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (_, index) {
              return Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black87),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  leading: AutoSizeText('${index + 1}'),
                  title: AutoSizeText('Respuesta'),
                  onTap: () {},
                ),
              );
            },
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Skip'),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: LinearProgressIndicator(
              color: Colors.amber[700],
              backgroundColor: const Color(0xFFD9D9D9),
              value: .5,
              minHeight: 20,
            ),
          ),
        ),
      ]),
    );
  }
}
