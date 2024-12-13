import 'package:flutter/material.dart';

import 'package:flutter_faculdade/core/core.dart';

class Atividade10 extends StatefulWidget {
  @override
  _Atividade10State createState() => _Atividade10State();
}

class _Atividade10State extends State<Atividade10> {
  TextEditingController num01Controller = TextEditingController();
  TextEditingController num02Controller = TextEditingController();
  TextEditingController num03Controller = TextEditingController();
  TextEditingController num04Controller = TextEditingController();
  TextEditingController num05Controller = TextEditingController();
  TextEditingController num06Controller = TextEditingController();
  TextEditingController num07Controller = TextEditingController();

  String resultado = "";
  String volume = "";
  String imc = "";
  bool mostrarCalc = true;
  bool mostrarImc = false;

  funcMostrarCalc() {
    setState(() {
      mostrarCalc = true;
      mostrarImc = false;
    });
  }

  funcMostrarImc() {
    print('teste');
    setState(() {
      mostrarImc = true;
      mostrarCalc = false;
    });
  }

  funcMostrarVolume() {
    setState(() {
      mostrarImc = false;
      mostrarCalc = false;
    });
  }

  paralelepipedo() {
    double num03 = double.parse(this.num03Controller.text); //te
    double num04 = double.parse(this.num04Controller.text);
    double num05 = double.parse(this.num05Controller.text);
    double volume = num03 * num04 * num05;
    this.volume = '$num03 x $num04 x $num05 = $volume';
    return this.volume;
  }

  calcImc() {
    double num06 = double.parse(this.num06Controller.text); //te
    double num07 = double.parse(this.num07Controller.text);

    double valorimc = num06 / (num07 * num07);
    setState(() {
      if (valorimc < 16)
        this.imc =
            '$num06 /($num07 x $num07) = $valorimc \nImc < 16 Magreza grave.';
      else if (valorimc < 17)
        this.imc =
            '$num06 /($num07 x $num07) = $valorimc \nImc entre 16 é 17 Magreza moderada.';
      else if (valorimc < 18.5)
        this.imc =
            '$num06 /($num07 x $num07) = $valorimc \nImc entre 17 é 18,5 Magreza Leve.';
      else if (valorimc < 25)
        this.imc =
            '$num06 /($num07 x $num07) = $valorimc \nImc entre 18,5 é 25 Saudavel.';
      else if (valorimc < 30.0)
        this.imc =
            '$num06 /($num07 x $num07) = $valorimc \nImc entre 25 é 30 Sobrepeso.';
      else if (valorimc < 35.0)
        this.imc =
            '$num06 /($num07 x $num07) = $valorimc \nImc entre 30 é 35 Obesidade Grau 1.';
      else if (valorimc < 40.0)
        this.imc =
            '$num06 /($num07 x $num07) = $valorimc \nImc entre 35 é 40 Obesidade Grau 2.';
      else
        this.imc =
            '$num06 /($num07 x $num07) = $valorimc \nImc > 40 Obesidade Grau 3.';
    });

    return this.imc;
  }

  subtrair() {
    double num01 = double.parse(this.num01Controller.text); //te
    double num02 = double.parse(this.num02Controller.text);
    double subtrair = num01 - num02;
    this.resultado = '$num01 - $num02 = $subtrair';
    return this.resultado;
  }

  dividir() {
    double num01 = double.parse(this.num01Controller.text); //te
    double num02 = double.parse(this.num02Controller.text);
    double dividir = num01 / num02;
    this.resultado = '$num01 / $num02 = $dividir';
    return this.resultado;
  }

  multiplicar() {
    double num01 = double.parse(this.num01Controller.text); //te
    double num02 = double.parse(this.num02Controller.text);
    double multiplicar = num01 * num02;
    this.resultado = '$num01 x $num02 = $multiplicar';
    return this.resultado;
  }

  somar() {
    int num01 = int.parse(this.num01Controller.text);
    int num02 = int.parse(this.num02Controller.text);
    int soma = num01 + num02;
    this.resultado = '$num01 + $num02 = $soma';
    return this.resultado;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: FlatButton(
                  onPressed: funcMostrarCalc,
                  child: Text(
                    'CALC',
                    style: TextStyle(color: AppColors.azulForte, fontSize: 22),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: FlatButton(
                  onPressed: funcMostrarImc,
                  child: Text(
                    'IMC',
                    style: TextStyle(color: AppColors.darkGreen, fontSize: 22),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: FlatButton(
                  onPressed: funcMostrarVolume,
                  child: Text(
                    'VOLUME',
                    style: TextStyle(
                      color: AppColors.darkRed,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
      body: mostrarCalc
          ? Column(
            children: [
              SizedBox(height: 100,),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: num01Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () => num01Controller.clear(),
                      icon: Icon(Icons.clear),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'informe o primeiro número',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: num02Controller,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () => num02Controller.clear(),
                      icon: Icon(Icons.clear),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'informe o segundo número',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        print(somar());
                        setState(somar);
                      },
                      child: Text('+'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print(subtrair());
                        setState(subtrair);
                      },
                      child: Text('-'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print(multiplicar());
                        setState(multiplicar);
                      },
                      child: Text('x'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print(dividir());
                        setState(dividir);
                      },
                      child: Text('/'),
                    ),
                  ],
                ),
              ),
              Text(
                this.resultado,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
          : mostrarImc
              ? Column(
                children: [
                  SizedBox(height: 100,),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      controller: num06Controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () => num06Controller.clear(),
                          icon: Icon(Icons.clear),
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'informe o Peso',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      controller: num07Controller,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () => num07Controller.clear(),
                          icon: Icon(Icons.clear),
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'informe a Altura',
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        child: Text('Calcular Imc'),
                        onPressed: () {
                          print(calcImc());
                          setState(calcImc);
                        },
                      )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        this.imc,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              )
              : Column(
                children: [
                  SizedBox(height: 100,),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      controller: num03Controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () => num03Controller.clear(),
                          icon: Icon(Icons.clear),
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'informe a Altura',
                      ),
                    ),
                  ),
                  Container(
                    
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      controller: num04Controller,
                      decoration: InputDecoration(
                        
                        suffixIcon: IconButton(
                          onPressed: () => num04Controller.clear(),
                          icon: Icon(Icons.clear),
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'informe a Largura',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      controller: num05Controller,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () => num05Controller.clear(),
                          icon: Icon(Icons.clear),
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'informe p Comprimento',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    child: Text('CalcularVolume'),
                    onPressed: () {
                      print(paralelepipedo());
                      setState(paralelepipedo);
                    },
                  ),
                  Text(
                    this.volume,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
    );
  }
}
