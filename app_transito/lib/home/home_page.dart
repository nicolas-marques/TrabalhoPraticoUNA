import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../core/app_images.dart';
import '../core/app_text_styles.dart';
import './../core/app_gradients.dart';
import './../core/app_colors.dart';
import './../Providers/construtor_categorias_gerais.dart';
import 'package:app_transito/data/categorias_gerais.dart';

import './../categorias/categorias_geral.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Categorias> categorias = DUMMY_Categorias;
  List<Categorias> _categoriaForDisplay = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _categoriaForDisplay = categorias;
  }

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: AppGradients.linearFundo,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: altura * 0.1,
            ),
            Container(
              width: largura * 0.9,
              height: altura * 0.1,
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
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: AppColors.buttonBlue,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 21),
                        child: Image.asset(AppImages.pesquisa),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 13.0),
                        child: Container(
                          height: 50,
                          width: largura * 0.5,
                          child: TextField(
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Pequisar',
                              hintStyle: AppTextStyles.buttons,
                            ),
                            style: AppTextStyles.textPesquisa,
                            onChanged: (text) {
                              text = text.toLowerCase();
                              setState(() {
                                _categoriaForDisplay = categorias.where((p) {
                                  String newDescription = p.title.toLowerCase();
                                  return newDescription.contains(text);
                                }).toList();
                              });
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 20),
                        child: Image.asset(AppImages.avancar),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: altura * 0.03,
            ),
            Text(
              'Categorias',
              style: AppTextStyles.titleBlue,
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ListView.builder(
                    itemCount: _categoriaForDisplay.length,
                    itemBuilder: (ctx, index) => Column(
                      children: [
                        SizedBox(
                          height: altura * 0.03,
                        ),
                        ChangeNotifierProvider.value(
                          value: _categoriaForDisplay[index],
                          child: CategoriasWidget(),
                        ),
                      ],
                    ),
                  ),
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
