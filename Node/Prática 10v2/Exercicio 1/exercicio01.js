/*
Usando Node.js e Postman/Insomnia, escreva um algoritmo 
que receba uma temperatura em Celsius, calcule e mostre 
essa temperatura em Fahrenheit.  
OBS:  F = (C * 1,8) + 32.
*/

const express = require('express');
const path = require('path');

const app = express();
const porta = 8030;
const hostname = '127.0.0.1';
const dir = path.join(__dirname, 'css');

app.use(express.static(dir));

//Iniciar:
app.listen(porta, hostname, function() {
  console.log(`Servidor iniciado. Host: ${hostname}. Porta: ${porta}`);
});

//URL: http://localhost:8030/
app.get('/', function(req, res) {
  res.send(dir);
});

//URL: http://localhost:8030/celsius/fahrenheit/:temperatura
app.get('/celsius/fahrenheit/:temperatura', function(req, res) {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/html; charset=utf-8');

  let celsius = parseFloat(req.params.temperatura);
  let fahrenheit = (celsius * 1.8) + 32;
  let pagina = `
    <html>
      <head>
        <title>Conversor de Temperatura</title>
        <link rel="stylesheet" href="/exercicio01.css">
      </head>
      <body>
        <h1>Conversor de Temperatura</h1>
        <div class="celsius">Celsius: ${celsius}</div>
        <div class="fahrenheit">Farenheit: ${fahrenheit}</div>
      </body>
    </html>
    `
  res.send(pagina);
});