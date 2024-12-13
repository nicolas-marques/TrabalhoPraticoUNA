/*
Baixar o Express. No terminal:
npm install express --save
*/
 
//Rodar:  node .\02_aula.js
 
var express = require('express');
var app = express();
var port = 8030;
var hostname = '127.0.0.1';
 
//http://127.0.0.1:8030
app.get('/', function(req, res) {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain; charset=utf-8');
  res.end('Olá, Mundo!!!');
});
 
app.listen(port, hostname, function() {
  console.log(`O servidor foi iniciado no host ${hostname} e porta ${port}`);
});
