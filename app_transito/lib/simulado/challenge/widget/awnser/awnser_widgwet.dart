import 'package:flutter/material.dart';
import 'package:app_transito/core/app_colors.dart';
import 'package:app_transito/core/app_text_styles.dart';
import 'package:app_transito/shared/models/awnser_model.dart';

class AwnserWidget extends StatelessWidget {
  final AwnserModel anwser;
  final bool isSelected;
  final bool disabled;
  final ValueChanged<bool> onTap;
  final bool paintIsRight;

  const AwnserWidget({
    Key key,
    @required this.anwser,
    @required this.onTap,
    this.isSelected = false,
    this.disabled = false,
    @required this.paintIsRight,
  }) : super(key: key);
  Color get _selectedColorRight => anwser.isRight
      ? AppColors.resultadopositivo
      : AppColors.resultadoNegativo;

  Color get _selectedBorderRight => anwser.isRight
      ? AppColors.resultadopositivo
      : AppColors.resultadoNegativo;

  TextStyle get _selectedTextStyleRight => anwser.isRight
      ? AppTextStyles.resultadoPositivo
      : AppTextStyles.resultadoNegativo;

  IconData get _selectedIconRight => anwser.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
      child: IgnorePointer(
        ignoring: disabled,
        child: GestureDetector(
          onTap: () {
            onTap(anwser.isRight);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 12),
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                      color: disabled
                          ? anwser.isRight
                              ? _selectedColorRight
                              : isSelected
                                  ? _selectedColorRight
                                  : AppColors.white
                          : isSelected
                              ? _selectedColorRight
                              : AppColors.white,
                      borderRadius: BorderRadius.circular(500),
                      border: Border.fromBorderSide(BorderSide(
                        width: 2,
                        color: disabled
                            ? anwser.isRight
                                ? _selectedBorderRight
                                : isSelected
                                    ? _selectedBorderRight
                                    : AppColors.textBlueTitle
                            : isSelected
                                ? _selectedBorderRight
                                : AppColors.textBlueTitle,
                      ))),
                  child: disabled
                      ? anwser.isRight
                          ? Icon(
                              _selectedIconRight,
                              color: AppColors.white,
                              size: 16,
                            )
                          : isSelected
                              ? Icon(
                                  _selectedIconRight,
                                  color: AppColors.white,
                                  size: 16,
                                )
                              : null
                      : isSelected
                          ? Icon(
                              _selectedIconRight,
                              color: AppColors.white,
                              size: 16,
                            )
                          : null,
                ),
                Expanded(
                  child: Text(
                    anwser.title,
                    style: disabled
                        ? anwser.isRight
                            ? _selectedTextStyleRight
                            : isSelected
                                ? _selectedTextStyleRight
                                : AppTextStyles.textSimuladoquestao
                        : isSelected
                            ? _selectedTextStyleRight
                            : AppTextStyles.textSimuladoquestao,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
