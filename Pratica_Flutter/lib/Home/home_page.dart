import 'package:flutter/material.dart';
import 'package:flutter_faculdade/atividades/atividade_10.dart';
import 'package:flutter_faculdade/atividades/atividade_2.dart';
import 'package:flutter_faculdade/atividades/atividade_3.dart';
import 'package:flutter_faculdade/atividades/atividade_4.dart';
import 'package:flutter_faculdade/atividades/atividade_5.dart';
import 'package:flutter_faculdade/atividades/atividade_6.dart';
import 'package:flutter_faculdade/atividades/atividade_7.dart';
import 'package:flutter_faculdade/atividades/atividade_8.dart';
import 'package:flutter_faculdade/atividades/atividade_9.dart';
import 'package:flutter_faculdade/core/app_gradients.dart';
import 'package:flutter_faculdade/core/app_text_styles.dart';
import 'package:flutter_faculdade/shared/buttons/level_button_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: SafeArea(
          top: true,
          child: Center(
            child: Container(
              child: Text(
                'Atividades flutter',
                style: AppTextStyles.body20,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(gradient: AppGradients.linear),
        child: Center(
          child: Container(
            height: 600,
            width: 600,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.white54),
            padding: EdgeInsets.all(80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Atividade2(),
                        ));
                  },
                  child: LevelButtonWidget(
                    label: "roxo",
                    title: "Atividade_2",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Atividade3(),
                        ));
                  },
                  child: LevelButtonWidget(
                    label: "verde",
                    title: "Atividade_3",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Atividade4(),
                        ));
                  },
                  child: LevelButtonWidget(
                    label: "laranja",
                    title: "Atividade_4",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Atividade5(),
                        ));
                  },
                  child: LevelButtonWidget(
                    label: "vermelho",
                    title: "Atividade_5",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Atividade6(),
                        ));
                  },
                  child: LevelButtonWidget(
                    label: "roxo",
                    title: "Atividade_6",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Atividade7(),
                        ));
                  },
                  child: LevelButtonWidget(
                    label: "verde",
                    title: "Atividade_7",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Atividade8(),
                        ));
                  },
                  child: LevelButtonWidget(
                    label: "laranja",
                    title: "Atividade_8",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Atividade9(),
                        ));
                  },
                  child: LevelButtonWidget(
                    label: "vermelho",
                    title: "Atividade_9",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Atividade10(),
                        ));
                  },
                  child: LevelButtonWidget(
                    label: "roxo",
                    title: "Atividade_10",
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
