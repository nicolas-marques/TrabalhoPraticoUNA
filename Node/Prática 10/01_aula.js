//Rodar:  node .\01_aula.js
 
const http = require('http');
 
const port = 8030;
const hostname = '127.0.0.1';
 
//http://127.0.0.1:8030
const server = http.createServer(function(req, res) {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain; charset=utf-8');
  res.end('Olá, Mundo!!!');
});
 
server.listen(port, hostname, function() {
  console.log(`O servidor foi iniciado no host ${hostname} e porta ${port}`);
});
