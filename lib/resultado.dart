import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciar;

  Resultado({
    super.key,
    required this.pontuacao,
    required this.quandoReiniciar,
  });

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabéns';
    } else if (pontuacao < 12) {
      return 'Foi bem!';
    } else if (pontuacao < 16) {
      return 'Impressionante';
    } else {
      return 'Incrível';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        IconButton(
          onPressed: quandoReiniciar,
          icon: Icon(Icons.refresh, color: Colors.blue, size: 30),
        ),
      ],
    );
  }
}
