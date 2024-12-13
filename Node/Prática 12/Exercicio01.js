const express = require('express');
const app = express();
const porta = 8030;
const hostname = '127.0.0.1';

app.use(express.json());

app.listen(porta, hostname, function () {
    console.log(`Servidor iniciado. Host: ${hostname}. Porta: ${porta}`);
});

alunos = [];
app.post('/', (req, res) => {
    console.log(req.body);
    const aluno = req.body;
    alunos.push(aluno);
    res.json(alunos);
});