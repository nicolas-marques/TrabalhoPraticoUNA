import 'package:flutter/material.dart';

class Atividade2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Text(
            'Olá, Andre Luiz!.',
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
      ), //Text.
    );
  }
}
