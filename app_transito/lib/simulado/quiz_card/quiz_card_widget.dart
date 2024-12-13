import 'package:app_transito/core/app_colors.dart';
import 'package:app_transito/core/core.dart';

import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;

  final String img;
  final VoidCallback onTap;
  const QuizCardWidget({
    @required this.title,
    @required this.img,
    @required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: altura * 0.03,
        ),
        Container(
          width: largura * 0.45,
          height: altura * 0.17
          ,
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
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: AppColors.titlerose,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 29.0, right: 32),
                      child: Container(
                        height: altura * 0.09,
                        width: largura * 0.3,
                        child: Image.asset("assets/images/$img.png"),
                      ),
                    ),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.textPrimeirosSocorros,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
