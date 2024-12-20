// load the http module
var http = require('http');

// configure our HTTP server
var server = http.createServer(function (request, response) {
  response.writeHead(200, {"Content-Type": "text/plain"});
  response.end("Hello!\n");
});

// listen on localhost:3621
server.listen(3621);
console.log("Server listening at http://127.0.0.1:3621/");
