/*
	Usando Node.js e Postman/Insomnia, escreva um algoritmo que 
    leia os três lados de um triângulo e imprima o tipo de triângulo:
    a.	Equilátero: os três lados são iguais.
    b.	Isósceles: 2 lados são iguais.
    c.	Escaleno: 3 lados diferentes.
*/

const express = require('express');
const path = require('path');

const app = express();
const porta = 8030;
const hostname = '127.0.0.1';
const dir_css = path.join(__dirname, 'css');

app.use(express.static(dir_css));

//Iniciar:
app.listen(porta, hostname, function() {
  console.log(`Servidor iniciado. Host: ${hostname}. Porta: ${porta}`);
});

//URL: http://localhost:8030/
app.get('/', function(req, res) {
  res.send(dir_css);
});

//URL: http://localhost:8030/triangulo/:lado1/:lado2/:lado3
app.get('/triangulo/:lado1/:lado2/:lado3', function(req, res) {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/html; charset=utf-8');

  let lado1 = parseFloat(req.params.lado1);
  let lado2 = parseFloat(req.params.lado2);
  let lado3 = parseFloat(req.params.lado3);
  let tipo;

  if (lado1 == lado2 && lado2 == lado3)
    tipo = 'triângulo equilátero';
  else if (lado1 == lado2 || lado1 == lado3 || lado2 == lado3)
    tipo = 'triângulo isósceles';
  else
    tipo = 'triângulo escaleno';

  let pagina = `
    <html>
      <head>
        <title>Tipo de Triângulo</title>
        <link rel="stylesheet" href="/exercicio02.css">
      </head>
      <body>
        <h1>Tipo de Triângulo</h1>
        <div class="lado">Primeiro lado: ${lado1}</div>
        <div class="lado">Segundo lado: ${lado2}</div>
        <div class="lado">Terceiro lado: ${lado3}</div>
        <div class="tipo">Tipo: ${tipo}</div>
      </body>
    </html>
    `
  res.send(pagina);
});