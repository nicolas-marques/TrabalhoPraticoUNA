import 'package:flutter/material.dart';

main() => runApp(
      MaterialApp(
        home: Inicio(),
        routes: {
          '/rotagenerica': (ctx) => RotaGenerica(),
          '/comprar': (ctx) => Comprar()
        },
        debugShowCheckedModeBanner: false,
      ),
    );

class Inicio extends StatefulWidget {
  @override
  InicioState createState() => InicioState();
}

class InicioState extends State<Inicio> {
  int indice = 0;
  final List<Widget> rotas = [
    PrimeiraRota(),
    SegundaRota(),
  ];
  void aoPressionar(int rotaSelecionada) {
    setState(
      () {
        this.indice = rotaSelecionada;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: rotas[this.indice],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this.indice,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Primeira Rota',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            label: 'Segunda Rota',
          ),
        ],
        onTap: (int pageTapped) {
          aoPressionar(pageTapped);
        },
      ),
    );
  }
}

class PrimeiraRota extends StatefulWidget {
  @override
  PrimeiraRotaState createState() => PrimeiraRotaState();
}

class PrimeiraRotaState extends State<PrimeiraRota> {
  @override
  Widget build(BuildContext context) {
    TextStyle estilo = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.green,
    );
    return Center(
      child: Text(
        'Primeira Rota',
        style: estilo,
      ),
    );
  }
}

class Comprar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 250
          ),
          Text("PÃ¡gina de Compra",
          style: TextStyle(
            color: Colors.purple,
            fontSize: 24,
          ),),
          ButtonBar(
            alignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: Text('Voltar para a segunda rota'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class RotaGenerica extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Cartao arguments = ModalRoute.of(context)!.settings.arguments as Cartao;

    return Scaffold(
      body: Column(
        children: [
          Image.network(arguments.url),
          Text(
            arguments.titulo,
            style: TextStyle(fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.bold),
          ),
          Text(
            arguments.subtitulo,
          ),
          Text(
            "R\$ ${arguments.preco.toStringAsFixed(2)}",
            style: TextStyle(
              color: Colors.orange,
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: Text('Voltar para a segunda rota'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SegundaRota extends StatefulWidget {
  @override
  SegundaRotaState createState() => SegundaRotaState();
}

class SegundaRotaState extends State<SegundaRota> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(40),
          child: Center(
            child: Text(
              'Galeria',
              style: TextStyle(
                fontSize: 30,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Cartao(
          titulo: 'Imagem 01',
          subtitulo:
              'Lorem Ipsum is simply dummy text of the printing and typesettin g industry. Lorem Ipsum has been the industry\'s standard dummy text ever sinc e the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
          preco: 3.10,
          url:
              'https://images.pexels.com/photos/213795/pexels-photo213795.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        ),
        Cartao(
          titulo: 'Imagem 02',
          subtitulo:
              'Lorem Ipsum is simply dummy text of the printing and typesettin g industry. Lorem Ipsum has been the industry\'s standard dummy text ever sinc e the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
          preco: 2.15,
          url:
              'https://images.pexels.com/photos/213791/pexels-photo213791.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        ),
        Cartao(
          titulo: 'Imagem 03',
          subtitulo:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it tomake a type specimen book. It has survived not only five centuries, but alsothe leap into electronic typesetting, remaining essentially unchanged. It waspopularised in the 1960s with the release of Letraset sheets containing LoremIpsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
          preco: 2.95,
          url:
              'https://images.pexels.com/photos/213797/pexels-photo213797.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        ),
        Cartao(
          titulo: 'Imagem 04',
          subtitulo:
              'Lorem Ipsum is simply dummy text of the printing and typesettin g industry. Lorem Ipsum has been the industry\'s standard dummy text ever sinc e the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
          preco: 1.97,
          url:
              'https://images.pexels.com/photos/213798/pexels-photo213798.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        ),
      ],
    );
  }
}

class Cartao extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final double preco;
  final String url;
  Cartao({
    required this.titulo,
    required this.subtitulo,
    required this.preco,
    required this.url,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[100],
      margin: EdgeInsets.fromLTRB(30, 5, 30, 15),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(4),
              child: Image(
                image: NetworkImage(this.url),
                height: 200,
                width: 400,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4),
              child: Text(
                this.titulo,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4),
              child: Text(
                this.subtitulo,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4),
              child: Text(
                'R\$ ${this.preco.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  child: Text('DETALHES'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/rotagenerica',
                        arguments: Cartao(
                            titulo: this.titulo,
                            subtitulo: this.subtitulo,
                            preco: this.preco,
                            url: this.url));
                  },
                ),
                TextButton(
                  child: Text('COMPRAR'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/comprar');
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}