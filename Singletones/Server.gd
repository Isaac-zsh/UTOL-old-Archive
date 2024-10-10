extends Node


var network = NetworkedMultiplayerENet.new()
var Ip = "127.0.0.1"
var PORT = 1425

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func ConnectToServer():
	network.create_client(Ip, PORT)
	get_tree().set_network_peer(null)
	get_tree().set_network_peer(network)
	
	network.connect("connection_failed", self, "_OnConnectionFailed")
	network.connect("connection_succeeded", self, "_OnConnectionSucceeded")

func SendPlayerState(player_state):
	rpc_unreliable_id(1, "ReceivePlayerState", player_state, get_tree().get_current_scene().get_name())

remote func ReceiveWorldState(world_state):
	get_node("/root/"+get_tree().get_current_scene().get_name()).UpdateWorldState(world_state)

remote func AlreadyConnected():
	print("User already connected")
	if get_tree().get_current_scene().get_name() == "AS":
		get_node("/root/AS").failed_popup(1)
		network.close_connection()

remote func auth():
	if get_tree().get_current_scene().get_name() == "AS":
		get_node("/root/AS").auth()

func _OnConnectionFailed():
	print("Failed to connect")
	get_node("/root/AS").failed_popup(0)
	network.close_connection()

func _OnConnectionSucceeded():
	print("Connected to server!")
	rpc_unreliable_id(1, "user_data", Globals.Username)
	
	#get_node("/root/Room1/YSort/KinematicBody2D").set_physics_process(true)

remote func SpawnPlayer(player_id, spawn_position):
	#get_node("/root/Room1").SpawnNewPlayer(player_id, spawn_position)
	pass

remote func DespawnPlayer(player_id):
	#get_node("/root/Room1").DespawnPlayer(player_id)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
