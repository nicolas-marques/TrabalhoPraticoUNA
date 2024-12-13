import 'package:flutter/material.dart';

class Atividade9 extends StatefulWidget {
  @override
  _Atividade9State createState() => _Atividade9State();
}

class _Atividade9State extends State<Atividade9> {
 int numeroVezes = 0;
 String mensagem = "Número de vezes em que o botão foi pressionado: 0.\nEssenúmero é par";
 void cliqueDoBotao() {
 numeroVezes = numeroVezes + 1;
 mensagem = "Número de vezes em que o botão foi pressionado: $numeroVezes.\nEsse número é ${numeroVezes % 2 == 0 ? "par" : "ímpar"}";
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página Inicial"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                mensagem),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(cliqueDoBotao);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}