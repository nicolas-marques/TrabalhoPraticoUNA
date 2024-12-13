import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Home(),
      ),
    );

class Descricao {
  String tituloBarraAplicativo;
  String tituloDescricao;
  String textoDescricao;

  Descricao(this.tituloBarraAplicativo, this.tituloDescricao, this.textoDescricao);
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álbum"),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: <Widget>[
          InkWell(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Image.network("https://images.pexels.com/photos/213781/pexels-photo213781.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
            ),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SegundaRota(Descricao('Nova York', 'Nova York, EUA', 'A cidade de Nova York compreende 5 distritos situados no encontro do rio Hudson com o Oceano Atlântico. No centro da cidade fica Manhattan, um distrito com alta densidade demográfica que está entre os principais centros comerciais, financeiros e culturais do mundo (Wikipedia).')))),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image.network("https://images.pexels.com/photos/213782/pexels-photo213782.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image.network("https://images.pexels.com/photos/213783/pexels-photo213783.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image.network("https://images.pexels.com/photos/213784/pexels-photo213784.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image.network("https://images.pexels.com/photos/213785/pexels-photo213785.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image.network("https://images.pexels.com/photos/213786/pexels-photo213786.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image.network("https://images.pexels.com/photos/213787/pexels-photo213787.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image.network("https://images.pexels.com/photos/213788/pexels-photo213788.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image.network("https://images.pexels.com/photos/213789/pexels-photo213789.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
          ),
        ],
      ),
    );
  }
}

class SegundaRota extends StatelessWidget {
  final Descricao descricao;

  SegundaRota(this.descricao);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${this.descricao.tituloBarraAplicativo}',
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(children: [
          Container(
            margin: EdgeInsets.fromLTRB(5, 90, 5, 2),
            child: Text(
              '${this.descricao.tituloDescricao}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(5, 90, 5, 2),
              child: Text(
                '${this.descricao.textoDescricao}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        tooltip: 'Voltar para a página inicial',
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
    );
  }
}

class TerceiraRota extends StatelessWidget {
  final Descricao descricao;

  TerceiraRota(this.descricao);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${this.descricao.tituloBarraAplicativo}',
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(children: [
          Container(
            margin: EdgeInsets.fromLTRB(5, 90, 5, 2),
            child: Text(
              '${this.descricao.tituloDescricao}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(5, 90, 5, 2),
              child: Text(
                '${this.descricao.textoDescricao}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        tooltip: 'Voltar para a página inicial',
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
    );
  }
}

class QuartaRota extends StatelessWidget {
  final Descricao descricao;

  QuartaRota(this.descricao);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${this.descricao.tituloBarraAplicativo}',
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(children: [
          Container(
            margin: EdgeInsets.fromLTRB(5, 90, 5, 2),
            child: Text(
              '${this.descricao.tituloDescricao}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(5, 90, 5, 2),
              child: Text(
                '${this.descricao.textoDescricao}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        tooltip: 'Voltar para a página inicial',
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
    );
  }
}

class QuintaRota extends StatelessWidget {
  final Descricao descricao;

  QuintaRota(this.descricao);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${this.descricao.tituloBarraAplicativo}',
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(children: [
          Container(
            margin: EdgeInsets.fromLTRB(5, 90, 5, 2),
            child: Text(
              '${this.descricao.tituloDescricao}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(5, 90, 5, 2),
              child: Text(
                '${this.descricao.textoDescricao}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        tooltip: 'Voltar para a página inicial',
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
    );
  }
}

class SextaRota extends StatelessWidget {
  final Descricao descricao;

  SextaRota(this.descricao);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${this.descricao.tituloBarraAplicativo}',
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(children: [
          Container(
            margin: EdgeInsets.fromLTRB(5, 90, 5, 2),
            child: Text(
              '${this.descricao.tituloDescricao}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(5, 90, 5, 2),
              child: Text(
                '${this.descricao.textoDescricao}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        tooltip: 'Voltar para a página inicial',
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
    );
  }
}

class SetimaRota extends StatelessWidget {
  final Descricao descricao;

  SetimaRota(this.descricao);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${this.descricao.tituloBarraAplicativo}',
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(children: [
          Container(
            margin: EdgeInsets.fromLTRB(5, 90, 5, 2),
            child: Text(
              '${this.descricao.tituloDescricao}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(5, 90, 5, 2),
              child: Text(
                '${this.descricao.textoDescricao}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        tooltip: 'Voltar para a página inicial',
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
    );
  }
}

class OitavaRota extends StatelessWidget {
  final Descricao descricao;

  OitavaRota(this.descricao);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${this.descricao.tituloBarraAplicativo}',
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(children: [
          Container(
            margin: EdgeInsets.fromLTRB(5, 90, 5, 2),
            child: Text(
              '${this.descricao.tituloDescricao}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(5, 90, 5, 2),
              child: Text(
                '${this.descricao.textoDescricao}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        tooltip: 'Voltar para a página inicial',
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
    );
  }
}

class NonaRota extends StatelessWidget {
  final Descricao descricao;

  NonaRota(this.descricao);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${this.descricao.tituloBarraAplicativo}',
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(children: [
          Container(
            margin: EdgeInsets.fromLTRB(5, 90, 5, 2),
            child: Text(
              '${this.descricao.tituloDescricao}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(5, 90, 5, 2),
              child: Text(
                '${this.descricao.textoDescricao}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        tooltip: 'Voltar para a página inicial',
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
    );
  }
}

class DecimaRota extends StatelessWidget {
  final Descricao descricao;

  DecimaRota(this.descricao);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${this.descricao.tituloBarraAplicativo}',
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(children: [
          Container(
            margin: EdgeInsets.fromLTRB(5, 90, 5, 2),
            child: Text(
              '${this.descricao.tituloDescricao}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(5, 90, 5, 2),
              child: Text(
                '${this.descricao.textoDescricao}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        tooltip: 'Voltar para a página inicial',
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
    );
  }
}