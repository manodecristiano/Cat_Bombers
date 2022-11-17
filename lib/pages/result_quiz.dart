import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../classes/quiz.dart';

class ResultQuiz extends StatelessWidget {
  const ResultQuiz({Key? key, required this.quiz}) : super(key: key);

  final Quiz quiz;
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
                    Text('Preguntas : ${quiz.questions.length}',
                        style: TextStyle(color: Colors.brown)),
                    Text('Correctas : ${quiz.percent}%'),
                  ]),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true, //para que no se expanda tanto
                itemCount: quiz.questions.length,
                itemBuilder: (_, index) {
                  return Card(
                    color: quiz.questions[index].correct
                        ? Colors.greenAccent.shade200
                        : Colors.redAccent.shade200,
                    child: ListTile(
                      leading: quiz.questions[index].correct
                          ? Icon(Icons.fire_truck, color: Colors.green.shade900)
                          : Icon(Icons.fire_hydrant_alt,
                              color: Colors.red.shade900),
                      title: AutoSizeText(quiz.questions[index].question),
                      subtitle: AutoSizeText(
                        quiz.questions[index].selected,
                        style: TextStyle(
                          decoration: quiz.questions[index].correct
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
