const WebSocket = require('ws');

const PORT = 5000
const wss = new WebSocket.Server({ port: PORT })
wss.on('connection', function connection(ws) {

  setInterval(function () {
    ws.send("ping")
  }, 1000)

  var socketAddr = ws._socket.remoteAddress.replace("::ffff:", "");
  console.log('Connection from ' + socketAddr + " - " + new Date())
  ws.on('message', function incoming(message) {
    message = message.toString();
    console.log('received message: ', message);
  })
})

console.log("server running on port", PORT)