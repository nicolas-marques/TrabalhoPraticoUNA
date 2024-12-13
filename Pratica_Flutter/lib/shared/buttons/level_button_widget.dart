import 'package:flutter/material.dart';
import 'package:flutter_faculdade/core/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonWidget extends StatelessWidget {
  final String label;
  final String title;
  LevelButtonWidget({
    Key? key,
    required this.label,
    required this.title,
  }) : assert(["roxo", "verde", "laranja", "vermelho"].contains(label));

  final config = {
    "roxo": {
      "color": AppColors.levelButtonRoxo,
      "borderColor": AppColors.levelButtonBorderRoxo,
      "fontColor": AppColors.levelButtonTextRoxo,
    },
    "verde": {
      "color": AppColors.levelButtonVerde,
      "borderColor": AppColors.levelButtonBorderVerde,
      "fontColor": AppColors.levelButtonTextVerde,
    },
    "laranja": {
      "color": AppColors.levelButtonLaranja,
      "borderColor": AppColors.levelButtonBorderLaranja,
      "fontColor": AppColors.levelButtonTextLaranja,
    },
    "vermelho": {
      "color": AppColors.levelButtonVermelho,
      "borderColor": AppColors.levelButtonBorderVermelho,
      "fontColor": AppColors.levelButtonTextVermelho,
    }
  };
  Color get color => config[label]!['color']!;
  Color get borderColor => config[label]!['borderColor']!;
  Color get fontColor => config[label]!['fontColor']!;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: color,
          border: Border.fromBorderSide(
              BorderSide(color: borderColor)),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 6),
          child: Text(title,
              style: GoogleFonts.notoSans(
                color: fontColor,
                fontSize: 13,
              )),
        ));
  }
}
