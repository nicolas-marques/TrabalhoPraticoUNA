import 'package:flutter/material.dart';
import 'package:flutter_faculdade/core/app_images.dart';


class Atividade4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      textDirection: TextDirection.ltr,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 120,
            width: 220,
            child: Image.asset(AppImages.coelhoGigante),
          ),
        ),
        Expanded(
          flex: 2,
          child: Image(
            image: NetworkImage(
              'https://picsum.photos/250?image=9',
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Image(
            image: NetworkImage(
              'https://picsum.photos/250?image=9',
            ),
          ),
        ),
      ],
    );
  }
}
