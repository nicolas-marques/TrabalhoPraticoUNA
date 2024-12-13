import 'package:app_transito/core/app_colors.dart';
import 'package:app_transito/core/app_gradients.dart';

import 'package:app_transito/core/app_text_styles.dart';
import 'package:app_transito/rotas/arguments_subcategoria.dart';
import 'package:flutter/material.dart';

class ButtonsCategoria extends StatelessWidget {
  final String title;
  final String rota;
  final String text;
  final String img;
  ButtonsCategoria(
      {@required this.title,
      @required this.rota,
      @required this.text,
      @required this.img});
  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;
    return Container(
      width: largura * 0.90,
      height: altura * 0.2,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
        gradient: AppGradients.linearButtons,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: GestureDetector(
          onTap: () => Navigator.of(context).pushNamed('/${rota}',
              arguments:
                  ArgumentosSUbcategoriaTexto(texto: text, title: title)),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: AppColors.titlerose,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 29.0, right: 32),
                  child: Container(
                    height: largura * 0.3,
                    width: altura * 0.1,
                    child: Image.asset("assets/images/$img.png"),
                  ),
                ),
                Expanded(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.textocategoria,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
