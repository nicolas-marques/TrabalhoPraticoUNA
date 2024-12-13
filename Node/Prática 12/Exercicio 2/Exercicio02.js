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
      <title>Calculadora - Equação do 2º Grau</title>
      <link rel="stylesheet" href="/Exercicio02.css">
  </head>
  <body>
      <form action = "/raizes" method = "POST">
          <h1>Calculadora - Equação do 2º Grau</h1>
          <div><input type="number" placeholder = "Informe o valor de A" name = "valorA" class = "valor"></div>
          <div><input type="number" placeholder = "Informe o valor de B" name = "valorB" class = "valor"></div>
          <div><input type="number" placeholder = "Informe o valor de C" name = "valorC" class = "valor"></div>
          <div><button type = "submit">Verificar resultado</button></div>
      </form>
  </body>
  </html>`

  res.send(pagina);
})

//URL: http://localhost:8030/raizes
app.post('/raizes', function(req,res) {
    statusCode = 200;
    res.setHeader('Content-Type', 'text/html; charset=utf-8');

    let A = parseFloat(req.body.valorA);
    let B = parseFloat(req.body.valorB);
    let C = parseFloat(req.body.valorC);
    let delta = (B*B) - (4 * A * C);
    let x1 = (-B + Math.sqrt(delta)) / (2*A);
    let x2 = (-B - Math.sqrt(delta)) / (2*A);
    let mensagem;

    if (A == 0 & B == 0 & C != 0)
        mensagem = `Coeficientes informados incorretamente.`
        if (C == 0)
            mensagem = `Igualdade confirmada: 0 = 0`
    
    else if (A == 0 & B != 0)
        mensagem = `Esta é uma equação de primeiro grau`

    else if (delta < 0)
        mensagem = `Esta equação não possui raízes reais`
    
    else if (delta == 0)
        mensagem = `Esta equação possui duas raízes iguais`
    
    else if (delta > 0)
        mensagem = `Esta equação possui duas raízes reais diferentes`

        pagina = `<html lang="pt-br">
        <head>
            <meta charset="UTF-8">
            <title>Calculadora - Equação do 2º Grau </title>
            <link rel="stylesheet" href="/Exercicio02.css">
        </head>
        <body>
            <h1>Calculadora - Equação do 2º Grau</h1>
            <div> A = ${A} B = ${B} C = ${C}</div>
            <div>${mensagem}</div>
            <div>Delta = ${delta}</div>
            <div>X' = ${x1}</div>
            <div>X'' = ${x2}</div>
        </body>
        </html>`
    res.send(pagina)

})