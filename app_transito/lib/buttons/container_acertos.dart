import 'package:flutter/material.dart';

class ContainerAcertos extends StatelessWidget {
  final Color cor;
  final int quantidade;
  const ContainerAcertos({@required this.cor, @required this.quantidade});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      color: cor,
      child: Text('${quantidade.toString()} acertos'),
    );
  }
}