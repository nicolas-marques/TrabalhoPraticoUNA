import 'package:flutter/material.dart';

class Atividade3 extends StatelessWidget {
  String nome = "Pedro Gandra";
  String dia = "Segunda-feira";
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: RichText(
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
          text: TextSpan(
            text: "Olá, ",
            style: TextStyle(
              color: Colors.green,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              backgroundColor: Colors.white,
            ), //TextStyle.
            children: <TextSpan>[
              TextSpan(
                text: '$nome',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.red,
                  decorationStyle: TextDecorationStyle.double,
                  backgroundColor: Colors.green,
                ),
              ),
              TextSpan(
                text: '!',
              ),
              TextSpan(
                text: '\nHoje é $dia!',
                style: TextStyle(
                  color: Colors.red,
                  backgroundColor: Colors.yellow,
                  decorationColor: Colors.red,
                  decorationStyle: TextDecorationStyle.double,
                ),
              ),
              TextSpan(
                text: '\nBom dia!',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
