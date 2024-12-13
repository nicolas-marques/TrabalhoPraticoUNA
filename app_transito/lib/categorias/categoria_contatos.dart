import 'package:app_transito/core/app_colors.dart';
import 'package:app_transito/core/app_gradients.dart';
import 'package:app_transito/core/app_images.dart';
import 'package:app_transito/core/app_text_styles.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app_transito/rotas/rotas.dart';
import 'package:flutter/material.dart';

class Contatos extends StatelessWidget {
  fazerLigacao(String telefone) async {
    String url = "tel:$telefone";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: altura * 0.04,
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
                height: altura * 0.04,
              ),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: altura * 0.04,
                        ),
                        Text(
                          'Orgãos\nCompetentes',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.titlerose,
                        ),
                        SizedBox(
                          height: altura * 0.04,
                        ),
                        Container(
                          width: largura *0.9,
                          height: altura * 0.5,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset:
                                    Offset(0, 2), // changes position of shadow
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Samu',
                                          style: AppTextStyles
                                              .titlePrimeiroSocorros,
                                        ),
                                        GestureDetector(
                                          onTap: () => fazerLigacao('192'),
                                          child: Row(
                                            children: [
                                              Text(
                                                '192',
                                                style: AppTextStyles
                                                    .titlePrimeiroSocorros,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                    height: 30,
                                                    width: 30,
                                                    child: Image.asset(
                                                        AppImages.telefone)),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Polícia Militar',
                                          style: AppTextStyles
                                              .titlePrimeiroSocorros,
                                        ),
                                        GestureDetector(
                                          onTap: () => fazerLigacao('190'),
                                          child: Row(
                                            children: [
                                              Text(
                                                '190',
                                                style: AppTextStyles
                                                    .titlePrimeiroSocorros,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                    height: 30,
                                                    width: 30,
                                                    child: Image.asset(
                                                        AppImages.telefone)),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Bombeiros',
                                          style: AppTextStyles
                                              .titlePrimeiroSocorros,
                                        ),
                                        GestureDetector(
                                          onTap: () => fazerLigacao('193'),
                                          child: Row(
                                            children: [
                                              Text(
                                                '193',
                                                style: AppTextStyles
                                                    .titlePrimeiroSocorros,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                    height: 30,
                                                    width: 30,
                                                    child: Image.asset(
                                                        AppImages.telefone)),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Disque Denúncia',
                                          style: AppTextStyles
                                              .titlePrimeiroSocorros,
                                        ),
                                        GestureDetector(
                                          onTap: () => fazerLigacao('181'),
                                          child: Row(
                                            children: [
                                              Text(
                                                '181',
                                                style: AppTextStyles
                                                    .titlePrimeiroSocorros,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                    height: 30,
                                                    width: 30,
                                                    child: Image.asset(
                                                        AppImages.telefone)),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Policia Rodovia',
                                          style: AppTextStyles
                                              .titlePrimeiroSocorros,
                                        ),
                                        GestureDetector(
                                          onTap: () => fazerLigacao('191'),
                                          child: Row(
                                            children: [
                                              Text(
                                                '191',
                                                style: AppTextStyles
                                                    .titlePrimeiroSocorros,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                    height: 30,
                                                    width: 30,
                                                    child: Image.asset(
                                                        AppImages.telefone)),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
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
