import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RankingListWidget extends StatelessWidget {
  final Map<String, double> ranking = {
    "Cristian": 3679,
    "Adría": 3356,
    "Josu": 3250,
    "Anais": 2792,
    "Carlos": 2501,
    "Rut": 2350,
    "Martí": 1580,
    "Carlos2": 1579,
  };

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ranking.length,
      itemBuilder: (context, index) {
        String name = ranking.keys.elementAt(index);
        double score = ranking.values.elementAt(index);

        return ListTile(
          title: Text(name),
          trailing: Text(score.toString()),
        );
      },
    );
  }
}
