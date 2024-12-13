import 'package:app_transito/buttons/buttons_navegacao.dart';
import 'package:app_transito/home/home_page.dart';

import 'package:flutter/material.dart';
import '../core/app_images.dart';
import '../core/app_text_styles.dart';
import './../core/app_gradients.dart';
import './../core/app_colors.dart';
import '../rotas/rotas.dart';
import 'package:app_transito/core/app_colors.dart';
import 'package:flutter/material.dart';

class SplashPageSimulado extends StatefulWidget {
  SplashPageSimulado({Key key}) : super(key: key);
  @override
  _SplashPageSimuladoState createState() => _SplashPageSimuladoState();
}

class _SplashPageSimuladoState extends State<SplashPageSimulado> {
  @override
  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppGradients.linearFundo),
        child: SafeArea(
          top: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                      onTap: () => Navigator.pushReplacementNamed(
                        context,
                        RotasApp.Home,
                      ),
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
              Spacer(),
              Text(
                'Simulado Detran',
                textAlign: TextAlign.center,
                style: AppTextStyles.titleSplashSimulado,
              ),
              Spacer(),
              Center(
                child: Image.asset(AppImages.simulado),
              ),
              Spacer(),
              ButtonNavegacao(
                label: 'Entrar',
                onTap: () {
                  Navigator.of(context).pushNamed(RotasApp.Simulado);
                },
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
