import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: PrimeiraRota(),
      ),
    );

// O objeto da classe Preço será enviado para a segunda rota.
class Preco {
  double etanol;
  double gasolina;
  Preco(this.etanol, this.gasolina);
  razao() => etanol / gasolina;
}

class PrimeiraRota extends StatefulWidget {
  @override
  _PrimeiraRotaState createState() => _PrimeiraRotaState();
}

class _PrimeiraRotaState extends State<PrimeiraRota> {
  final TextEditingController etanolController = TextEditingController();
  final TextEditingController gasolinaController = TextEditingController();
  String resp = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Primeira Rota"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: this.etanolController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => this.etanolController.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'Informe o preço do Etanol',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: this.gasolinaController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => this.gasolinaController.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'Informe o preço da Gasolina',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              double etanol = double.parse(this.etanolController.text);
              double gasolina = double.parse(this.gasolinaController.text);
              Preco preco = Preco(etanol, gasolina);
              Navigator.push(context, MaterialPageRoute(builder: (context) => SegundaRota(preco))).then((resposta) {
                setState(() {
                  resp = resposta;
                });
              });
            },
            child: Text('Ir para a Segunda Rota'),
          ),
          Text(
            this.resp,
            style: TextStyle(
              fontSize: 25,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class SegundaRota extends StatelessWidget {
  final Preco preco;
  SegundaRota(this.preco);
  @override
  Widget build(BuildContext context) {
    String resp = "Abasteça com Gasolina";

    if (preco.razao() < 0.7) resp = "Abasteça com Etanol";

    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Rota'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              '${preco.etanol.toStringAsFixed(2)} / ${preco.gasolina.toStringAsFixed(2)} = ${preco.razao().toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 40,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${resp}',
              style: TextStyle(
                fontSize: 25,
                color: Colors.blue,
              ),
            ),
            ElevatedButton(
              child: Text('Ir para a Primeira Rota'),
              onPressed: () {
                Navigator.pop(context, resp);
              },
            ),
          ],
        ),
      ),
    );
  }
}