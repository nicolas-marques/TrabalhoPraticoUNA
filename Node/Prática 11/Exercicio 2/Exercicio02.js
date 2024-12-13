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
app.use(express.urlencoded({extended:false}));
app.use(express.json());

//URL: http://localhost:8030/
app.get('/', function(req,res) {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/html', 'charset=utf-8');

  pagina = `<html lang="pt-br">
  <head>
      <title>Formulário</title>
      <link rel="stylesheet" href="/Exercicio02.css">
  </head>
  <body>
      <form action = "/lados" method = "GET">
          <h1>É um triângulo?</h1>
          <div><input type="number" placeholder = "Lado" name = "lado1" class = "lado"></div>
          <div><input type="number" placeholder = "Lado" name = "lado2" class = "lado"></div>
          <div><input type="number" placeholder = "Lado" name = "lado3" class = "lado"></div>
          <div><button type = "submit">Verificar Lados</button></div>
      </form>
  </body>
  </html>`

  res.send(pagina);
});
//URL: http://localhost:8030/lados
app.get('/lados', function(req, res) {
    statusCode = 200;
    res.setHeader('Content-Type', 'text/html; charset=utf-8');

    let lado1 = parseInt(req.query.lado1);
    let lado2 = parseInt(req.query.lado2);
    let lado3 = parseInt(req.query.lado3);
    let mensagem;

    if (lado1 < lado2 + lado3 || lado2 < lado1 + lado3 || lado3 < lado1+lado2) {
        mensagem = `É um triângulo!`
    }

    else {
        mensagem = `Não é um triângulo.`
    }

    pagina = `<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <title>É um triângulo?</title>
        <link rel="stylesheet" href="/Exercicio02.css">
    </head>
    <body>
        <h1>É um triângulo?</h1>
        <div>Lado: ${lado1}</div>
        <div>Lado: ${lado2}</div>
        <div>Lado: ${lado3}</div>
        <div>${mensagem}</div>
    </body>
    </html>`
  
    res.send(pagina)
});

