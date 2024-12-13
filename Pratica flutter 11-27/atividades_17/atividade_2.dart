import 'package:flutter/material.dart';

void main() => runApp(MeuAplicativo());

class MeuAplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrimeiraRota(),
      routes: {
        SegundaRota.caminhoDaRota: (context) => SegundaRota(),
        TerceiraRota.caminhoDaRota: (context) => TerceiraRota(),
      },
    );
  }
}

class PrimeiraRota extends StatelessWidget {
  final TextEditingController valorEmRealController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Valor em Real'),
      ),
      body: Column(children: [
        Container(
          margin: EdgeInsets.all(10),
          child: TextField(
            controller: this.valorEmRealController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () => this.valorEmRealController.clear(),
                icon: Icon(Icons.clear),
              ),
              border: OutlineInputBorder(),
              labelText: 'Informe o valor em Real(R\$)',
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: ElevatedButton(
              child: Text('Próximo'),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  SegundaRota.caminhoDaRota,
                  arguments: double.parse(this.valorEmRealController.text),
                );
              }),
        ),
      ]),
    );
  }
}

class SegundaRota extends StatelessWidget {
  static const caminhoDaRota = '/segundaRota';

  final TextEditingController cotacaoDolarController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double valorEmReal = ModalRoute.of(context)!.settings.arguments as double;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cotação'),
      ),
      body: Column(children: [
        Container(
          margin: EdgeInsets.all(10),
          child: TextField(
            controller: this.cotacaoDolarController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () => this.cotacaoDolarController.clear(),
                icon: Icon(Icons.clear),
              ),
              border: OutlineInputBorder(),
              labelText: 'Informe a cotação do Dólar',
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: ElevatedButton(
              child: Text('Próximo'),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  TerceiraRota.caminhoDaRota,
                  arguments: ArgumentosDaRota(
                    valorEmReal,
                    double.parse(this.cotacaoDolarController.text),
                  ),
                );
              }),
        ),
      ]),
    );
  }
}

class TerceiraRota extends StatelessWidget {
  static const caminhoDaRota = '/terceiraRota';

  converter(double valorEmReal, double cotacao) => valorEmReal / cotacao;

  @override
  Widget build(BuildContext context) {
    ArgumentosDaRota argumentos = ModalRoute.of(context)!.settings.arguments as ArgumentosDaRota;
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado'),
      ),
      body: Center(
        child: Container(
          child: Text(
            'R\$ ${argumentos.valorEmReal.toStringAsFixed(2)} = U\$ ${converter(argumentos.valorEmReal, argumentos.cotacao).toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 20,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class ArgumentosDaRota {
  double valorEmReal;
  double cotacao;
  ArgumentosDaRota(this.valorEmReal, this.cotacao);
}
