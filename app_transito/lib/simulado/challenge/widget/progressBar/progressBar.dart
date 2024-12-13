import 'package:app_transito/core/app_gradients.dart';
import 'package:app_transito/simulado/challenge/widget/progressBar/progressControler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarraProgresso extends StatelessWidget {
  final void Function() nextQuestion;
  BarraProgresso({@required this.nextQuestion});
  void nextPage() {
    nextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 30,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF3F4768), width: 3),
          borderRadius: BorderRadius.circular(50)),
      child: GetBuilder<ProgressController>(
          init: ProgressController(nextQuestion: nextPage),
          builder: (controller) {
            print(controller.animation.value);
            return Stack(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) => Container(
                    width: constraints.maxWidth -
                        constraints.maxWidth * controller.animation.value,
                    decoration: BoxDecoration(
                        gradient: AppGradients.linearTimer,
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(50 - controller.animation.value * 50 < 1
                            ? "${(((50 - controller.animation.value * 50) * 60)).round()} segundos"
                            : "${(50 - controller.animation.value * 50).floor().round()}min"),
                        Icon(
                          Icons.access_time_rounded,
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
