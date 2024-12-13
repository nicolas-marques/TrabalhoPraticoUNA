import 'dart:math';
import 'dart:ui';

import 'package:app_transito/core/app_colors.dart';
import 'package:flutter/material.dart';

class AppGradients {
  static final linearAppBar = LinearGradient(colors: [
    Color.fromRGBO(245, 161, 161, 1),
    Color.fromRGBO(247, 215, 210, 1),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  static final lineMapsDetails = LinearGradient(colors: [
    Color.fromRGBO(37, 54, 87, 0.8),
    Color.fromRGBO(166, 154, 202, 0.9),
  ], begin: Alignment.centerLeft, end: Alignment.centerRight);

  static final linearFundo = LinearGradient(colors: [
    Color.fromRGBO(245, 161, 161, 1),
    Color.fromRGBO(247, 215, 210, 1),
    Color.fromRGBO(245, 161, 161, 1),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  static final linearTimer = LinearGradient(colors: [
     Color.fromRGBO(166, 154, 202, 1),
    Color.fromRGBO(220, 109, 138, 1),
    
  ], begin: Alignment.centerLeft, end: Alignment.centerRight,stops: [0.4, 1],);

  static final linearQuiz = LinearGradient(colors: [
    Color.fromRGBO(166, 154, 202, 1),
    Color.fromRGBO(37, 54, 87, 1),
    Color.fromRGBO(37, 54, 87, 1),
    Color.fromRGBO(220, 109, 138, 1),
    Color.fromRGBO(220, 109, 138, 1),
    Color.fromRGBO(231, 109, 138, 1),
    Color.fromRGBO(245, 161, 161, 1),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter,);

  static final linearButtons = LinearGradient(
      colors: [
        Color.fromRGBO(166, 154, 202, 1),
        Color.fromRGBO(231, 109, 138, 1),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.4, 1],
      transform: GradientRotation(0 * pi));

  static final linearButtonsNavegacao = LinearGradient(
      colors: [
        Color.fromRGBO(166, 154, 202, 1),
        Color.fromRGBO(231, 109, 138, 1),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      transform: GradientRotation(0 * pi));
}
