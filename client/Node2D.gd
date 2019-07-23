extends Node2D


var ws = null

var time_start = 0
var time_now = 0

func _ready():
    ws = WebSocketClient.new()
    ws.connect("connection_established", self, "_connection_established")
    ws.connect("connection_closed", self, "_connection_closed")
    ws.connect("connection_error", self, "_connection_error")

    # var url = "ws://192.168.178.49:5000"
    # var url = "ws://echo.websocket.org"
    # var url = "ws://192.168.6.218:5000"
    var url = $LineEdit.text
	
    print("Connecting to " + url)
    ws.connect_to_url(url)

func _connection_established(protocol):
    print("Connection established with protocol: ", protocol)

func _connection_closed(m):
    print("Connection closed")
    print(m)

func _connection_error():
    print("Connection error")

func _process(_delta):
    if ws.get_connection_status() == ws.CONNECTION_CONNECTING || ws.get_connection_status() == ws.CONNECTION_CONNECTED:
        ws.poll()
    if ws.get_peer(1).is_connected_to_host():
        if ws.get_peer(1).get_available_packet_count() > 0 :
            var test = ws.get_peer(1).get_packet()
            print('recieve %s' % test.get_string_from_ascii ())

func _on_Button_button_down():
    var str_time = str(OS.get_unix_time())
    print("send time : " + str_time)

    if ws.get_peer(1).is_connected_to_host():
        ws.get_peer(1).put_var(str_time)
