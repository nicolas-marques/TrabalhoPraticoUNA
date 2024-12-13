import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  static final TextStyle titleBlue = GoogleFonts.roboto(
    color: AppColors.textBlue,
    fontSize: 56,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle titlerose = GoogleFonts.roboto(
    color: AppColors.titlerose,
    fontSize: 50,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle buttons = GoogleFonts.roboto(
    color: AppColors.titlerose,
    fontSize: 32,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle textPesquisa = GoogleFonts.roboto(
    color: AppColors.titlerose,
    fontSize: 22,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle titlePrimeiroSocorros = GoogleFonts.roboto(
    color: AppColors.textBlue,
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );
  
  static final TextStyle resultadoPositivo = GoogleFonts.roboto(
    color: AppColors.darkGreen,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle resultadoNegativo = GoogleFonts.roboto(
    color: AppColors.resultadoNegativo,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle body = GoogleFonts.notoSans(
    color: AppColors.grey,
    fontSize: 13,
    fontWeight: FontWeight.normal,
  );
  static final TextStyle textPrimeirosSocorros = GoogleFonts.roboto(
    color: AppColors.textBlue,
    fontSize: 22,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle textSimuladotitle = GoogleFonts.roboto(
    color: AppColors.textBlue,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle textSimuladoquestao = GoogleFonts.roboto(
    color: AppColors.textBlue,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle textocategoria = GoogleFonts.roboto(
    color: AppColors.textBlue,
    fontSize: 30,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle titleSplash = GoogleFonts.roboto(
    color: AppColors.textBlueTitle,
    fontSize: 70,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle titleSplashSimulado = GoogleFonts.roboto(
    color: AppColors.textBlueTitle,
    fontSize: 75,
    fontWeight: FontWeight.w400,
  );
}
