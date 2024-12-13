import 'package:flutter/material.dart';
import 'package:pratica13/rota/componente/componente.dart';
import 'package:pratica13/rota/rota.dart';
class PrimeiraTela extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
 Corpo corpo = Corpo('1');
 Botao botao = Botao(RotasApp.SegundaTela);
 return Tela('Primeira Tela', corpo, botao);
 }
}
class SegundaTela extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
 Corpo corpo = Corpo('2');
 Botoes botoes = Botoes(RotasApp.TerceiraTela);
 return Tela('Segunda Tela', corpo, botoes);
 }
}
class TerceiraTela extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
 Corpo corpo = Corpo('3');
 Botoes botoes = Botoes(RotasApp.QuartaTela);
 return Tela('Terceira Tela', corpo, botoes);
 }
}
class QuartaTela extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
 Corpo corpo = Corpo('4');
 Botoes botoes = Botoes(RotasApp.SegundaTela);
 return Tela('quarta tela', corpo, botoes);
 }
}



class Tela extends StatelessWidget {
 final String titulo;
 final Widget corpo, navegacao;
 Tela(this.titulo, this.corpo, this.navegacao);
 @override
 Widget build(BuildContext context) {
 return Scaffold(
 appBar: AppBar(
 title: Text('${this.titulo}'),
 ),
 body: Center(
 child: Column(
 children: [
 corpo,
 navegacao,
 ],
 ),
 ),
 );
 }
}