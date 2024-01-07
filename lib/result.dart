import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final int maxScore;
  final Function() restartApplication;

  const Result({
    super.key,
    required this.score,
    required this.maxScore,
    required this.restartApplication,
  });

  String get finalResult {
    var percent = score / maxScore;
    if (percent >= 0.9) {
      return "Você está de parabéns!";
    } else if (percent >= 0.8) {
      return "Quem te viu, que te vê!";
    } else if (percent >= 0.7) {
      return "Achei que nao chegaria até aqui!";
    } else if (percent >= 0.6) {
      return "Essa foi por pouco!";
    } else if (percent >= 0.5) {
      return "Você quase conseguiu!";
    } else if (percent >= 0.3) {
      return "Vai ter que estudar um pouco mais!";
    }
    return "Está precisando estudar um pouco mais!";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            finalResult,
            style: const TextStyle(fontSize: 28),
          ),
          Text(
            "Voce atingiu $score de $maxScore pontos (${(score / maxScore * 100).toStringAsFixed(2)}% de acertos)",
            style: const TextStyle(fontSize: 28),
          ),
          TextButton.icon(
            style: TextButton.styleFrom(
                foregroundColor: Colors.blue, textStyle: const TextStyle(fontSize: 18)),
            icon: const Icon(Icons.restart_alt),
            onPressed: restartApplication,
            label: const Text('Reiniciar?'),
          ),
        ],
      ),
    );
  }
}
