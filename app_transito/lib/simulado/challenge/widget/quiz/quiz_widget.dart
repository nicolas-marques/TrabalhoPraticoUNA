import 'package:app_transito/core/app_colors.dart';
import 'package:app_transito/core/app_text_styles.dart';
import 'package:app_transito/shared/models/awnser_model.dart';
import 'package:app_transito/shared/models/question_model.dart';
import 'package:app_transito/simulado/challenge/widget/awnser/awnser_widgwet.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;
  const QuizWidget({
    @required this.question,
    @required this.onSelected,
  });

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;
  bool paintIsRight = false;

  AwnserModel awnser(int index) => widget.question.awnser[index];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.titlerose,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:6.0),
            child: Text(widget.question.title,
                textAlign: TextAlign.center,
                style: AppTextStyles.textSimuladotitle),
          ),
          SizedBox(
            height: 6,
            width: double.infinity,
            child: Container(
              color: AppColors.containerBlue,
            ),
          ),
          for (var i = 0; i < widget.question.awnser.length; i++)
            AwnserWidget(
              anwser: awnser(i),
              paintIsRight: paintIsRight,
              disabled: indexSelected != -1,
              isSelected: indexSelected == i,
              onTap: (value) {
                indexSelected = i;

                setState(() {
                  paintIsRight = true;
                });

                widget.onSelected(value);
              },
            ),
        ],
      ),
    );
  }
}
