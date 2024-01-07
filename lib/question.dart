import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String text;

  const Question({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(40),
      decoration: const BoxDecoration(color: Colors.black),
      child: Text(
        text,
        style: const TextStyle(fontSize: 24),
        textAlign: TextAlign.left,
      ),
    );
  }
}
