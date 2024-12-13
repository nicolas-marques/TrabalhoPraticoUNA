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

  //URL: http://localhost:8030/notas/:nota1/:nota2/:nota3
app.get('/notas/:nota1/:nota2/:nota3', function(req,res) {
    res.statusCode = 200
    res.setHeader('Content-Type', 'text/html; charset=utf-8');

    let nota1 = parseFloat(req.params.nota1)
    let nota2 = parseFloat(req.params.nota2)
    let nota3 = parseFloat(req.params.nota3)
    let media = parseFloat((nota1 + nota2 + nota3)/3)
    let mensagem

    if (media < 3) {
        mensagem = 'REPROVADO'
    }

    else if (media >= 3 && media <7) {
        mensagem = 'EXAME'
    }

    else {
        mensagem = 'APROVADO'
    }

    let pagina = `
    <html>
      <head>
        <title>Cálculo de Média</title>
        <link rel="stylesheet" href="/exercicio03.css">
      </head>
      <body>
        <h1>Cálculo de Média</h1>
        <div>Média: ${media}</div>
        <div>Situação: ${mensagem}</div>
      </body>
    </html>
    `
  res.send(pagina);
  })