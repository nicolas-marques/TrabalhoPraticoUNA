import 'package:app_transito/core/app_colors.dart';
import 'package:app_transito/core/app_gradients.dart';
import 'package:app_transito/core/app_images.dart';
import 'package:app_transito/core/app_text_styles.dart';
import 'package:app_transito/rotas/rotas.dart';
import 'package:app_transito/shared/models/quiz_model.dart';
import 'package:app_transito/simulado/challenge/challenge_page.dart';
import 'package:app_transito/simulado/quiz_card/quiz_card_widget.dart';
import 'package:app_transito/simulado/simualdo_controler.dart';
import 'package:app_transito/simulado/simulado_state.dart';
import 'package:flutter/material.dart';

class HomeSimulado extends StatefulWidget {
  const HomeSimulado({Key key}) : super(key: key);

  @override
  _HomeSimuladoState createState() => _HomeSimuladoState();
}

class _HomeSimuladoState extends State<HomeSimulado> {
  final controller = SimuladoControler();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.getQuizzes();
    controller.stateNotifierw.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;
    if (controller.state == SimuladoState.success) {
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
                        onTap: () => Navigator.pushReplacementNamed(
                          context,
                          RotasApp.SplashSimulado,
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
                SizedBox(
                  height: altura * 0.03,
                ),
                Text(
                  'Simulados\nDetran',
                  style: AppTextStyles.titleBlue,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                   height: altura * 0.03,
                ),
                Expanded(
                  child: Container(
                    child: GridView.count(
                      
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      children: controller.quizzes
                          .map(
                            (e) => QuizCardWidget(
                              title: e.title,
                              img: e.imagem,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ChallengePage(
                                        question: e.question,
                                        title: e.title,
                                      ),
                                    ));
                              },
                            ),
                          )
                          .toList(),
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.containerBlue,
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
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}
