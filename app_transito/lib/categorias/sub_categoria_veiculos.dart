import 'package:app_transito/buttons/buttons_categoria.dart';
import 'package:app_transito/rotas/arguments_subcategoria.dart';
import 'package:app_transito/rotas/rotas.dart';

import 'package:flutter/material.dart';
import '../core/app_images.dart';
import '../core/app_text_styles.dart';
import './../core/app_gradients.dart';
import './../core/app_colors.dart';

class SubCategoriaVeiculo extends StatefulWidget {
  @override
  _SubCategoriaVeiculoState createState() => _SubCategoriaVeiculoState();
}

class _SubCategoriaVeiculoState extends State<SubCategoriaVeiculo> {
  @override
  Widget build(BuildContext context) {
    ArgumentosSUbcategoria argumentos =
        ModalRoute.of(context).settings.arguments as ArgumentosSUbcategoria;
    final altura = MediaQuery.of(context).size.height;
    
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: AppGradients.linearFundo,
        ),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: altura * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 37.0),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Image.asset(AppImages.volta),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 37),
                    child: GestureDetector(
                      onTap: () => Navigator.pushReplacementNamed(
                        context,
                        RotasApp.Home,
                      ),
                      child: Image.asset(AppImages.home),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: altura * 0.03,
              ),
              Text(
                argumentos.title,
                textAlign: TextAlign.center,
                style: AppTextStyles.titleBlue,
              ),
              SizedBox(
                height: altura * 0.04,
              ),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: altura * 0.04,
                        ),
                        ButtonsCategoria(
                          title: 'Legislação',
                          rota: 'texto',
                          text: argumentos.textLegislacao,
                          img: 'martelo',
                        ),
                        SizedBox(
                          height: altura * 0.04,
                        ),
                        ButtonsCategoria(
                          title: 'Cuidados no Trânsito',
                          rota: 'texto',
                          text: argumentos.textCuidados,
                          img: 'segurança',
                        ),
                        SizedBox(
                          height: altura * 0.04,
                        ),
                        ButtonsCategoria(
                          title: 'Primeiros Socorros',
                          rota: 'texto',
                          text: argumentos.textPrimeirosSocorros,
                          img: 'primeirosSocorros',
                        ),
                        SizedBox(
                          height: altura * 0.02,
                        ),
                      ],
                    ),
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
