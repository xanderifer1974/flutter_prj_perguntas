import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(PerguntasApp());

class _PerguntaAppState extends State<PerguntasApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Quando celebramos o nascimento de Cristo?',
      'respostas': [
        {'texto': 'Dia das mães', 'pontuacao': 0},
        {'texto': 'Carnaval', 'pontuacao': 0},
        {'texto': 'Dia dos Pais', 'pontuacao': 0},
        {'texto': 'Natal', 'pontuacao': 10},
      ],
    },
    {
      'texto': 'Qual o nome da Mãe de Jesus?',
      'respostas': [
        {'texto': 'Joana', 'pontuacao': 0},
        {'texto': 'Andreia', 'pontuacao': 0},
        {'texto': 'Maria', 'pontuacao': 10},
        {'texto': 'Isabel', 'pontuacao': 0}
      ],
    },
    {
      'texto': 'Qual foi o primeiro milagre de Jesus?',
      'respostas': [
        {'texto': 'Multiplicou os pães', 'pontuacao': 0},
        {'texto': 'Transformou água em vinho', 'pontuacao': 10},
        {'texto': 'Curou um paralítico', 'pontuacao': 0},
        {'texto': 'Andou sobre as águas', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Quantos apóstolos tinha Jesus?',
      'respostas': [
        {'texto': '10', 'pontuacao': 0},
        {'texto': '20', 'pontuacao': 0},
        {'texto': '12', 'pontuacao': 10},
        {'texto': '30', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Quando comemoramos a ressurreição de Cristo?',
      'respostas': [
        {'texto': 'No dia da independência', 'pontuacao': 0},
        {'texto': 'Na Páscoa', 'pontuacao': 10},
        {'texto': 'No dia do Trabalhador', 'pontuacao': 0},
        {'texto': 'No dia de São João', 'pontuacao': 0},
      ]
    },
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario(){
    setState((){
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntasApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
