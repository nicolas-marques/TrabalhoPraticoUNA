import 'package:flutter/material.dart';
import 'package:flutter_faculdade/core/app_images.dart';

class Atividade8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        title: Text('Pagina Inicial'),
      ),
      body: Center(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Container(
                  height: 300,
                  width: 300,
                  child: Image.asset(AppImages.bambole),
                ),
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.yellow,
        ),
      ),
    ),
      backgroundColor: Colors.blue[900],
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Exemplo de botão',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
    );
  }
}
