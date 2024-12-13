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

//URL: http://localhost:8030/produto/:id
app.get('/produto/:id', function(req,res) {
    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/html; charset=utf-8');

    let id = req.params.id;
    let mensagem;

    if (id == 1) {
        mensagem = 'Código: 1   Produto: Sapato   Preço: R$99,99'
    }

    else if (id == 2) {
        mensagem = 'Código: 2   Produto: Bolsa   Preço: R$103,89'
    }

    else if (id == 3) {
        mensagem = 'Código: 3   Produto: Camisa   Preço: R$49,98'
    }

    else if (id == 4) {
        mensagem = 'Código: 4   Produto: Calça   Preço: R$89,72'
    }

    else if (id == 5) {
        mensagem = 'Código: 5   Produto: Blusa   Preço: R$97,35'
    }

    else {
        mensagem = 'Código de produto não encontrado.'
    }

    let pagina = `
    <html>
      <head>
        <title>Produtos</title>
        <link rel="stylesheet" href="/exercicio04.css">
      </head>
      <body>
        <h1>Produtos</h1>
        <div>${mensagem}</div>
      </body>
    </html>
    `
  res.send(pagina);
})