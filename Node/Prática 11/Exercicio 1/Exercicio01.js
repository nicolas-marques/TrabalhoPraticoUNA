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

//Body Parser
app.use(express.urlencoded({extended:false}))
app.use(express.json())

//URL: http://localhost:8030/
app.get('/', function(req,res) {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/html', 'charset=utf-8');

  pagina = `<html lang="pt-br">
  <head>
      <title>Formulário</title>
      <link rel="stylesheet" href="/Exercicio01.css">
  </head>
  <body>
      <form action = "/precos" method = "GET">
          <h1>Cadastro de Preços</h1>
          <div><input type="number" placeholder = "Preço" name = "preco1" class = "preco"></div>
          <div><input type="number" placeholder = "Preço" name = "preco2" class = "preco"></div>
          <div><input type="number" placeholder = "Preço" name = "preco3" class = "preco"></div>
          <div><button type = "submit">Cadastrar Preços</button></div>
      </form>
  </body>
  </html>`

  res.send(pagina);
})

//URL: http://localhost:8030/precos
app.get('/precos', function(req, res) {
  statusCode = 200;
  res.setHeader('Content-Type', 'text/html; charset=utf-8');
  let preco1 = parseFloat(req.query.preco1);
  let preco2 = parseFloat(req.query.preco2);
  let preco3 = parseFloat(req.query.preco3);
  let maior = Math.max(preco1,preco2,preco3);
  let menor = Math.min(preco1,preco2,preco3);
  let media = preco1+preco2+preco3/3;

  let pagina = `<html lang="pt-br">
  <head>
      <meta charset="UTF-8">
      <title>Preços Cadastrados</title>
      <link rel="stylesheet" href="/Exercicio01.css">
  </head>
  <body>
      <h1>Preços Cadastrados</h1>
      <div>Menor Preço: ${menor}</div>
      <div>Maior Preço: ${maior}</div>
      <div>Média dos Preços: ${media}</div>
  </body>
  </html>`

  res.send(pagina)
})