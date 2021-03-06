extends Node


# ----------------------------- DECLARE VARIABLES ------------------------------

var network : NetworkedMultiplayerENet = NetworkedMultiplayerENet.new()
var port : int = 17017
var max_player_amount : int = 100

# ADD CHECK FOR FOR STRING INPUT "localhost" and bind it to loopback adress!

# ---------------------------------- RUN CODE ----------------------------------


func _ready() -> void:
	# Connect to server signals
	network.connect("peer_connected", self, "on_peer_connected")
	network.connect("peer_disconnected", self, "on_peer_disconnected")
	
	# If server not created and started, do something
	if not start_server():
		return
	
	get_tree().set_network_peer(network)


remotesync func send_message_to_all_peers(message : String) -> void:
	var requester_peer_id : int = get_tree().get_rpc_sender_id()
	print("SERVER requester peer id: ", requester_peer_id)
	message = "[" + str(requester_peer_id) + "] " + message
	rpc("receive_message", message)

remotesync func receive_message(message: String) -> void:
	print("[SERVER] Message received: ", message)


# ------------------------------ DECLARE FUNCTIONS -----------------------------


func start_server() -> bool:
	var server_creation_error = network.create_server(port, max_player_amount)

	# Check if there was an error creating the server
	match server_creation_error:
		OK:
			print("Server successfully created!")
			return true
		ERR_ALREADY_IN_USE:
			printerr("(!) ERROR: You created a server already!")
			return false
		ERR_CANT_CREATE:
			printerr("(!) ERROR: The server could not be created!")
			return false
		_:
			printerr("|!| ERROR: Unknown error!")
			return false


func on_peer_connected(peer_id: int) -> void:
	print("Peer " + str(peer_id) + " connected to the server!")


func on_peer_disconnected(peer_id: int) -> void:
	print("Peer " + str(peer_id) + " disconnected from the server!")
