import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  Resposta({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      width: double.infinity,
      child: ElevatedButton(
        child: Text(text),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        )
      ),  
    );
  }
}
