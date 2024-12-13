import 'package:app_transito/core/app_colors.dart';
import 'package:app_transito/core/app_gradients.dart';
import 'package:app_transito/core/app_images.dart';
import 'package:app_transito/core/app_text_styles.dart';
import 'package:app_transito/rotas/arguments_subcategoria.dart';
import 'package:app_transito/rotas/rotas.dart';
import 'package:flutter/material.dart';

class TextoComplementar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ArgumentosSUbcategoriaTexto argumentos = ModalRoute.of(context)
        .settings
        .arguments as ArgumentosSUbcategoriaTexto;
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: AppGradients.linearFundo,
        ),
        child: SafeArea(
          top: true,
          child: SingleChildScrollView(
                      child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: altura * 0.02,
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
                  height: altura * 0.02,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: altura * 0.02,
                      ),
                      Text(
                        argumentos.title,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.titlerose,
                      ),
                      SizedBox(
                        height: altura * 0.02,
                      ),
                      Container(
                        width: largura * 0.9,
                        height: altura * 0.65,
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
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: AppColors.titlerose,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Text(
                                        argumentos.texto,
                                        style:
                                            AppTextStyles.textPrimeirosSocorros,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: altura * 0.03,
                      ),
                      Container(
                        width: largura * 0.9,
                        height: altura * 0.09,
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
                            onTap: () => Navigator.of(context)
                                .pushNamed(RotasApp.Contatos),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                color: AppColors.buttonBlue,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Container(
                                      width: 35,
                                      height: 70,
                                      child: Image.asset(AppImages.telefone),
                                    ),
                                  ),
                                  Text(
                                    'Contatos',
                                    style: AppTextStyles.buttons,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: altura * 0.03,
                      ),
                    ],
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
