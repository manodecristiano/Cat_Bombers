import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../classes/Questionario.dart';

class ResultQuiz extends StatelessWidget {
  const ResultQuiz({Key? key, required this.questionario}) : super(key: key);

  final Questionario questionario;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 245, 229, 1.0),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black87,
        ),
        title: AutoSizeText(
          questionario.name,
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
            Container(
              padding: const EdgeInsets.all(10),
              margin:
                  const EdgeInsets.only(left: 2, right: 2, top: 2, bottom: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black45, width: 1),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Preguntas : ${questionario.preguntas.length}',
                        style: TextStyle(color: Colors.brown)),
                    Text('Correctas : ${questionario.percent.toInt()}%'),
                  ]),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true, //para que no se expanda tanto
                itemCount: questionario.preguntas.length,
                itemBuilder: (_, index) {
                  return Card(
                    color: questionario.preguntas[index].correct
                        ? Colors.greenAccent.shade200
                        : Colors.redAccent.shade200,
                    child: ListTile(
                      leading: questionario.preguntas[index].correct
                          ? Icon(Icons.fire_truck, color: Colors.green.shade900)
                          : Icon(Icons.fire_hydrant_alt,
                              color: Colors.red.shade900),
                      title:
                          AutoSizeText(questionario.preguntas[index].pregunta),
                      subtitle: AutoSizeText(
                        questionario.preguntas[index].selected,
                        style: TextStyle(
                          decoration: questionario.preguntas[index].correct
                              ? TextDecoration.none
                              : TextDecoration.lineThrough,
                        ),
                      ),
                      //  trailing:
                      //    AutoSizeText(quiz.questions[index].correctAnswer),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
