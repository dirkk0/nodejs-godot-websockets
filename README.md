# nodejs-godot-websockets
Example of combining a nodejs server with a Godot client via websockets.
This is just a proof of concept that you can use websockets in the combination Node plus Godot from an Android APK.


## Server

The server is a very simple Node websocket server that only receives messages, and sends one 'ping' every second. Initialize it with ```yarn``` or ```yarn add ws``` and start it with ```node server.js```.


## Client

![alt text](screenshot.png "yes, it's not pretty.")

