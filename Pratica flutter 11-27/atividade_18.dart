import 'dart:html';

import 'package:flutter/material.dart';

void main() => runApp(MeuAplicativo());

class MeuAplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrimeiraRota(),
      routes: {
        '/generica': (context) => RotaGenerica(),
      },
    );
  }
}

class PrimeiraRota extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primeira Rota'),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.amber,
          child: ListView(
            children: [
              SizedBox(
                height: 230,
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  accountName: Text("Ana"),
                  accountEmail: Text("ana@ana.com.br"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      "A",
                      style: TextStyle(fontSize: 40.0, color: Colors.red),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 150,
                child: ListTile(
                  leading: Icon(Icons.video_collection),
                  title: Text("Rota 02"),
                  subtitle: Text("Siga para a Rota 02."),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    print('Ir para a Rota 02.');
                    Navigator.of(context).pushNamed(
                      '/generica',
                      arguments: ArgumentosRota(
                          title: 'Segunda Rota',
                          text: 'Voltar Para primeira Rota',
                          // cor: Colors.blue[900],
                          cor: Colors.black),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 150,
                child: ListTile(
                  leading: Icon(Icons.analytics),
                  title: Text("Rota 03"),
                  subtitle: Text("Siga para a Rota 03"),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    print('Ir para a Rota 03.');
                    Navigator.of(context).pushNamed(
                      '/generica',
                      arguments: ArgumentosRota(
                        title: 'Terceira Rota',
                        text: 'Voltar Para  primeira Rota',
                        cor: Colors.purple[900],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 140,
                child: ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Rota 01"),
                  subtitle: Text("Voltar para a Rota 01"),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    print('Voltar para a Rota 01.');
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: const Text('Corpo'),
      ),
    );
  }
}

class RotaGenerica extends StatelessWidget {
  const RotaGenerica({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ArgumentosRota argumentos =
        ModalRoute.of(context)!.settings.arguments as ArgumentosRota;
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(argumentos.title),
      ),
      body: Container(
        width: double.infinity,
        color: argumentos.cor,
        child: Center(
          child: Column(
            children: [
              Spacer(),
              Text(
                argumentos.title,
                style: TextStyle(color: Colors.redAccent, fontSize: 30),
              ),
              Spacer(),
              Container(
                height: altura * 0.15,
                width: largura * 0.7,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.blue,
                ),
                child: Text(
                  argumentos.text,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ArgumentosRota {
  final Color? cor;
  final String title;
  final String text;
  ArgumentosRota({required this.title, required this.text, required this.cor});
}
