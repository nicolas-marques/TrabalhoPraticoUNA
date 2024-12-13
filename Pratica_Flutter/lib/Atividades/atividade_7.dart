import 'package:flutter/material.dart';
import 'package:flutter_faculdade/core/app_images.dart';

class Atividade7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Container(
                  height: 350,
                  width: 350,
                  child: Image.asset(AppImages.praia),
                ),
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.yellow,
        ),
      ),
    );
  }
}
