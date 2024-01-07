import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Map<String, Object> answer;
  final void Function() whenSelected;

  const Answer({super.key, required this.answer, required this.whenSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 15, 5),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: whenSelected,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            alignment: Alignment.centerLeft),
        child: Text(
          "${answer['option']} ${answer['description']}",
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
