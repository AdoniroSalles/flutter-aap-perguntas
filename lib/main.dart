import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  // Aqui você pode adicionar lógica de estado, se necessário
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });

    print('Resposta selecionada: $_perguntaSelecionada');
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> perguntas = [
      {
        'texto': 'Qual é a sua cor favorita?',
        'respostas': ['Azul', 'Verde', 'Vermelho', 'Laranja'],
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'respostas': ['Cachorro', 'Gato', 'Pássaro', 'Peixe'],
      },
      {
        'texto': 'Qual é o seu esporte favorito?',
        'respostas': ['Futebol', 'Basquete', 'Vôlei', 'Natação'],
      },
    ];

    List<Widget> respostas = [];
    for (var textoResposta
        in perguntas[_perguntaSelecionada].cast()['respostas']) {
      print(textoResposta);
      respostas.add(Resposta(text: textoResposta, onPressed: _responder));
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Perguntas')),
        body: Column(
          children: [
            Questao(texto: perguntas[_perguntaSelecionada]['texto'].toString()),
            ...respostas,
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}
