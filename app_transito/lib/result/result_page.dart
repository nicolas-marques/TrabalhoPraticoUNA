import 'package:app_transito/buttons/buttons_navegacao.dart';
import 'package:app_transito/core/app_colors.dart';
import 'package:app_transito/core/app_gradients.dart';
import 'package:app_transito/core/app_images.dart';
import 'package:app_transito/core/app_text_styles.dart';
import 'package:app_transito/rotas/rotas.dart';
import 'package:app_transito/shared/models/question_model.dart';
import 'package:app_transito/simulado/home_simulado.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final List<QuestionModel> question;

  final String title;
  final int length;
  final int result;
  const ResultPage(
      {@required this.title,
      @required this.length,
      @required this.result,
      @required this.question});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppGradients.linearFundo),
        padding: EdgeInsets.only(top: 20),
        width: double.infinity,
        child: SafeArea(
          top: true,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pushReplacementNamed(
                        context,
                        RotasApp.Home,
                      ),
                      child: Image.asset(
                        AppImages.home,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Resultado:',
                style: AppTextStyles.titleBlue,
              ),
              SizedBox(
                height: 10,
              ),
              result >= 21
                  ? Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset(AppImages.parabens),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Image.asset(AppImages.dicas),
                          Container(
                            width: 112,
                            height: 127,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              'Estudar \nmais \n$title!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.textBlueTitle,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
              SizedBox(
                height: 20,
              ),
              result >= 21
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: AppGradients.linearButtonsNavegacao,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            alignment: AlignmentDirectional.center,
                            width: double.infinity,
                            height: 70,
                            decoration: BoxDecoration(
                                color: AppColors.resultadopositivo,
                                borderRadius: BorderRadius.circular(32)),
                            child: Text(
                              '$result/$length acertos',
                              style: AppTextStyles.textPrimeirosSocorros,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: AppGradients.linearButtonsNavegacao,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            alignment: AlignmentDirectional.center,
                            width: double.infinity,
                            height: 70,
                            decoration: BoxDecoration(
                                color: AppColors.resultadoNegativo,
                                borderRadius: BorderRadius.circular(32)),
                            child: Text(
                              '$result/$length acertos',
                              style: AppTextStyles.textPrimeirosSocorros,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
              Spacer(),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        result >= 21 ? "Parabéns!" : "Continue estudando",
                        style: AppTextStyles.titlePrimeiroSocorros,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text.rich(
                    TextSpan(
                        text: "Você concluiu ",
                        style: TextStyle(
                          color: AppColors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                        children: [
                          TextSpan(
                            text: "\n$title",
                            style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          TextSpan(
                            text: "\ncom $result de $length acertos.",
                            style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  ButtonNavegacao(
                    label: 'Refazer Prova',
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        RotasApp.Simulado,
                      );
                    },
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
