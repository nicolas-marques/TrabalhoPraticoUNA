import 'package:app_transito/core/app_gradients.dart';
import 'package:app_transito/core/app_text_styles.dart';
import 'package:app_transito/shared/widget/progress_indicator_widget.dart';

import 'package:app_transito/simulado/challenge/widget/progressBar/progressBar.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentePage;
  final int length;
  final void Function() nextQuestion;

  const QuestionIndicatorWidget({
    @required this.nextQuestion,
    @required this.currentePage,
    @required this.length,
  });
  nextPage() {

    nextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Questão $currentePage ",
                      style: AppTextStyles.textPrimeirosSocorros,
                    ),
                    Text(" de $length",
                        style: AppTextStyles.textPrimeirosSocorros),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: BarraProgresso(
                    nextQuestion: nextPage,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          ProgressIndicatorWidget(value: currentePage / length)
        ],
      ),
    );
  }
}
