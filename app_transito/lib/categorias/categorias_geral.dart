import 'package:app_transito/rotas/arguments_subcategoria.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../core/app_text_styles.dart';
import './../core/app_gradients.dart';
import './../core/app_colors.dart';

import './../Providers/construtor_categorias_gerais.dart';

class CategoriasWidget extends StatefulWidget {
  @override
  _CategoriasWidgetState createState() => _CategoriasWidgetState();
}

class _CategoriasWidgetState extends State<CategoriasWidget> {
  @override
  Widget build(BuildContext context) {
    final Categorias categorias = Provider.of(context, listen: false);
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
          onTap: () => Navigator.of(context).pushNamed('/${categorias.rotas}',
              arguments: ArgumentosSUbcategoria(
                  textLegislacao: categorias.textLegislacao,
                  textCuidados: categorias.textCuidados,
                  title: categorias.title,
                  textPrimeirosSocorros: categorias.textPrimeirosSocorros)),
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
                    width: altura * 0.13,
                    child:
                        Image.asset("assets/images/${categorias.images}.png"),
                  ),
                ),
                Expanded(
                  child: Text(
                    categorias.title,
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
