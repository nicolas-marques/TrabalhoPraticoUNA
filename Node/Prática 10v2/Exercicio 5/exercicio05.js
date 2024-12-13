/*
41)	Usando Node.js e Postman/Insomnia, escreva um algoritmo que 
    determine a situação de peso de um indivíduo determinada através 
    do IMC (Índice de Massa Corpórea). O IMC é definido como a relação 
    entre o peso (em kg) e o quadrado da Altura (em m) do indivíduo: 
    
    IMC = PESO / ALTURA^2. 
    
    A situação do peso é indicada na tabela abaixo:
*/

const express = require('express');
const path = require('path');

const app = express();
const port = 8030;
const hostname = '127.0.0.1';
const dir_css = path.join(__dirname, 'css');

app.use(express.static(dir_css));

//Iniciar o servidor:
app.listen(port, hostname, function() {
  console.log(`Servidor iniciado com sucesso. Host: ${hostname}. Porta: ${port}`);
});

//URL: http://localhost/
app.get('/', function(req, res) {
  res.send(dir_css);
});

//URL: http://localhost:8030/imc/:peso/:altura
app.get('/imc/:peso/:altura', function(req, res) {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/html; charset=utf-8');

  let peso = parseFloat(req.params.peso);
  let altura = parseFloat(req.params.altura);
  let imc = peso / Math.pow(altura, 2);
  let resp;

  if (peso < 18.5)
    resp = "Abaixo do Peso";
  else if (imc < 25)
    resp = "Peso Ideal. Parabéns!!!";
  else if (imc < 30)
    resp = "Levemente Acima do Peso";
  else if (imc < 35)
    resp = "Obesidade de Grau I";
  else if (imc < 40)
    resp = "Obesidade de Grau II (Severa)";
  else
    resp = "Obesidade de Grau III (Mórbida)";

  let pagina = `
  <html>
    <head>
      <title>Cálculo do IMC</title>
      <link rel="stylesheet" href="/exercicio05.css">
    </head>
    <body>
      <h1>IMC</h1>
      <div class='imc'>IMC: ${req.params.peso} / (${req.params.altura} ^ 2) </div>
      <div class='imc'>IMC: ${imc.toFixed(2)}</div>
      <div class='resp'>Resposta: ${resp}</div>
    </body>
  </html>
  `;

  res.send(pagina);
});