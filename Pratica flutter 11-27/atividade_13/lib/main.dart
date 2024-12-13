
import 'package:flutter/material.dart';
import 'package:pratica13/rota/rota.dart';
import './rota/tela/tela.dart';
void main() => runApp(
 MaterialApp(
 initialRoute: RotasApp.PrimeiraTela,
 routes: {
 RotasApp.PrimeiraTela: (context) => PrimeiraTela(),
 RotasApp.SegundaTela: (context) => SegundaTela(),
 RotasApp.TerceiraTela: (context) => TerceiraTela(),
 RotasApp.QuartaTela: (context) => QuartaTela(),
 },
 ),
 );
