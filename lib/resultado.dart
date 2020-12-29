import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    switch (pontuacao) {
      case 10:
        {
          return 'Você somente acertou uma pergunta!';
        }
        break;
      case 10:
        {
          return 'Você acertou duas perguntas!';
        }
        break;
      case 30:
        {
          return 'Você acertou três perguntas!';
        }
        break;
      case 40:
        {
          return 'Você acertou 4 perguntas!';
        }
        break;
      case 50:
        {
          return 'Parabêns! Você acertou todas as perguntas!';
        }
        break;

      default:
        {
          return 'Você errou todas as perguntas!';
        }
        break;
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
            style: TextStyle(fontSize: 28),
          ),
        ),
        FlatButton(
          child: Text('Reiniciar?',
          style: TextStyle(fontSize: 18),),
          textColor: Colors.blue,
          onPressed: quandoReiniciarQuestionario,)
      ],
    );
  }
}
