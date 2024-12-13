import 'package:flutter/material.dart';
import 'package:flutter_faculdade/core/app_colors.dart';
import 'package:flutter_faculdade/core/app_images.dart';

class Atividade6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 250,
        height: 250,
        child: Stack(
          alignment: AlignmentDirectional.center,
          textDirection: TextDirection.ltr,
          children: <Widget>[
            Container(
              width: 250,
              height: 250,
              color: Colors.white,
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    
                    Colors.purple,
                    
                    AppColors.azulForte,
                    AppColors.azulForte,
                    Colors.purple,
                    
                  ],
                ),
              ),
              
              
            ),
            Center(
              child: Container(
                height: 120,
                width: 220,
                child: Image.asset(AppImages.minions),
              ),
            )
          ],
          
        ),
      ),
    );
  }
}
