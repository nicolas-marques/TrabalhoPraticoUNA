import 'package:flutter/widgets.dart';

class Categorias with ChangeNotifier {
  final String images;
  final String title;
  final String rotas;
  final String textLegislacao;
  final String textCuidados;
  final String textPrimeirosSocorros;
  Categorias({@required this.images, @required this.title, @required this.rotas, @required this.textCuidados, @required this.textLegislacao,@required this.textPrimeirosSocorros,});
}