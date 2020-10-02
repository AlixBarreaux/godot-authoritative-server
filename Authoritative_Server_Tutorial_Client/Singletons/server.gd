extends Node


# ----------------------------- DECLARE VARIABLES ------------------------------

var network : NetworkedMultiplayerENet = NetworkedMultiplayerENet.new()
var ip_adress : String = "127.0.0.1"
var port : int = 17017

# ADD CHECK FOR FOR STRING INPUT "localhost" and bind it to loopback adress!


# ---------------------------------- RUN CODE ----------------------------------


func _ready() -> void:
	if not connect_to_server():
		return
	
	get_tree().set_network_peer(network)
	
	# Connect to server signals
	network.connect("connection_failed", self, "on_connection_failed")
	network.connect("connection_succeeded", self, "on_connection_succeeded")


# ------------------------------ DECLARE FUNCTIONS -----------------------------


func connect_to_server() -> bool:
	var client_creation_error = network.create_client(ip_adress, port)
	
	# Check if there was an error creating the client
	match client_creation_error:
		OK:
			print("Client successfully created!")
			return true
		ERR_ALREADY_IN_USE:
			printerr("(!) ERROR: You created a client already!")
			return false
		ERR_CANT_CREATE:
			printerr("(!) ERROR: The client could not be created!")
			return false
		_:
			printerr("|!| ERROR: Unknown error!")
			return false


func on_connection_failed() -> void:
	print("(!) WARNING: Failed to connect to server!")


func on_connection_succeeded() -> void:
	print("Connected to server!")
