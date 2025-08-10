import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resposta.dart';
import 'package:projeto_perguntas/resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Amarelo', 'pontuacao': 8},
        {'texto': 'Verde', 'pontuacao': 5},
        {'texto': 'Vermelho', 'pontuacao': 4},
        {'texto': 'Laranja', 'pontuacao': 2},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Cachorro', 'pontuacao': 8},
        {'texto': 'Gato', 'pontuacao': 9},
        {'texto': 'Pássaro', 'pontuacao': 4},
        {'texto': 'Peixe', 'pontuacao': 6},
      ],
    },
    {
      'texto': 'Qual é o seu esporte favorito?',
      'respostas': [
        {'texto': 'Futebol', 'pontuacao': 5},
        {'texto': 'Basquete', 'pontuacao': 3},
        {'texto': 'Vôlei', 'pontuacao': 1},
        {'texto': 'Natação', 'pontuacao': 6},
      ],
    },
  ];

  // Aqui você pode adicionar lógica de estado, se necessário
  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });

      print('Resposta selecionada: $_perguntaSelecionada');
      print('Pontuação Total: $_pontuacaoTotal');
    }
  }

  void _reiniciarPerguntas() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Perguntas')),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(
                pontuacao: _pontuacaoTotal,
                quandoReiniciar: _reiniciarPerguntas,
              ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}
