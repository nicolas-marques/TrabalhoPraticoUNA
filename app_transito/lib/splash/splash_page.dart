import 'package:app_transito/buttons/buttons_navegacao.dart';
import 'package:flutter/material.dart';
import '../core/app_images.dart';
import '../core/app_text_styles.dart';
import './../core/app_gradients.dart';
import './../core/app_colors.dart';
import '../rotas/rotas.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppGradients.linearFundo),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spacer(flex: 2,),
            Text(
              'DEDÉ',
              style: AppTextStyles.titleSplash,
            ),
            Spacer(),
            Text(
              'Uma maneira diferente de lidar com trânsito',
              style: TextStyle(fontSize: 18, color: AppColors.textBlueTitle),
            ),
            Spacer(),
            Center(
              child: Container(
                height: altura * 0.5,
                width: largura * 0.8,
                child: Image.asset(AppImages.splash),
              ),
            ),
            Spacer(
              flex: 2,
            ),
            ButtonNavegacao(
              label: 'Entrar',
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  RotasApp.Home,
                );
              },
            ),
            Spacer(
              flex: 2,
            )
          ],
        ),
      ),
    );
  }
}
