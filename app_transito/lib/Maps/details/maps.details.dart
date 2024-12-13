import 'package:app_transito/core/core.dart';
import 'package:flutter/material.dart';

class MapsDetails extends StatelessWidget {
  final String nome;
  final List imagem;

  const MapsDetails({Key key, this.nome, this.imagem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: Colors.black.withOpacity(0.5),
            height: altura * 0.3,
            width: largura,
            child: ListView.builder(
              scrollDirection:Axis.horizontal,
              itemCount: imagem.length,
              itemBuilder: (context, index) => Image.network(
                '${imagem[index]}',
                height: altura * 0.3,
                width: largura,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: altura * 0.08,
            width: largura * 0.8,
            margin: EdgeInsets.all(24),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                gradient: AppGradients.lineMapsDetails),
            child: Text(nome,
                textAlign: TextAlign.center, style: AppTextStyles.textPesquisa),
          ),
        ],
      ),
    );
  }
}
