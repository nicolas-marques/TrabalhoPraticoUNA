import 'package:app_transito/core/app_colors.dart';
import 'package:app_transito/core/app_gradients.dart';
import 'package:app_transito/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ButtonNavegacao extends StatelessWidget {
  
  final String label;
  final VoidCallback onTap;
  const ButtonNavegacao({@required this.label, @required this.onTap});
  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;
    return Container(
              width: largura * 0.8,
              height: altura * 0.08,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
                gradient: AppGradients.linearButtonsNavegacao,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: GestureDetector(
                  onTap: onTap,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: AppColors.buttonBlue,
                    ),
                    child: Center(
                        child: Text(
                      label,
                      style: AppTextStyles.buttons,
                    )),
                  ),
                ),
              ),
            );
  }
}