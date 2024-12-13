import 'package:app_transito/Maps/controllers/maps_controller.dart';
import 'package:app_transito/buttons/buttons_navegacao.dart';
import 'package:app_transito/core/app_colors.dart';
import 'package:app_transito/core/app_gradients.dart';
import 'package:app_transito/core/app_images.dart';
import 'package:app_transito/result/result_page.dart';
import 'package:app_transito/rotas/rotas.dart';
import 'package:app_transito/shared/models/question_model.dart';
import 'package:app_transito/simulado/challenge/challenge_controller.dart';
import 'package:app_transito/simulado/challenge/widget/progressBar/progressControler.dart';
import 'package:app_transito/simulado/challenge/widget/question_indicator/question_indicator_widget.dart';
import 'package:app_transito/simulado/challenge/widget/quiz/quiz_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> question;
  final String title;

  ChallengePage({@required this.question, @required this.title});
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();
  @override
  void initState() {
    pageController.addListener(() {
      controller.currentPage = pageController.page.toInt() + 1;
    });
    super.initState();
  }

  void nextPage() {
    if (controller.currentPage < widget.question.length) {
      
      pageController.nextPage(
          duration: Duration(milliseconds: 800), curve: Curves.decelerate);
    }
  }

  void finalizarProva() {
    if (controller.currentPage < widget.question.length)
      pageController.nextPage(
          duration: Duration(milliseconds: 800), curve: Curves.decelerate);
    else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(
            title: widget.title,
            question: widget.question,
            length: widget.question.length,
            result: controller.qtdAnwserRight,
          ),
        ),
      );
    }
  }

  void onSelected(bool value) {
    if (value) {
      controller.qtdAnwserRight++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(gradient: AppGradients.linearAppBar),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () => Navigator.pushReplacementNamed(
                                context,
                                RotasApp.Home,
                              ),
                          child: Image.asset(
                            AppImages.home,
                          )),
                      GestureDetector(
                          onTap: nextPage,
                          child: Image.asset(
                            AppImages.avancarpagina,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ValueListenableBuilder<int>(
                  valueListenable: controller.currentPageNotifier,
                  builder: (context, value, _) => QuestionIndicatorWidget(
                    nextQuestion: finalizarProva,
                    currentePage: value,
                    length: widget.question.length,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: AppColors.containerBlue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                    gradient: AppGradients.linearQuiz,
                    borderRadius: BorderRadius.circular(32)),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: AppGradients.linearQuiz,
                        borderRadius: BorderRadius.circular(32)),
                    height: 500,
                    width: 350,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: PageView(
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        controller: pageController,
                        children: widget.question
                            .map((e) => QuizWidget(
                                  question: e,
                                  onSelected: onSelected,
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ButtonNavegacao(
              label: "Finalizar Prova",
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      title: widget.title,
                      question: widget.question,
                      length: widget.question.length,
                      result: controller.qtdAnwserRight,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
