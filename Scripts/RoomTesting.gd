extends Node2D

onready var player_instance = load("res://Scenes/tscn/Player.tscn").instance()
var GlobalScene_ = load("res://Scenes/tscn/GlobalScene.tscn").instance()
var player_server = preload("res://Scenes/tscn/PlayerServer.tscn")
var last_world_state = 0

func _ready():
	DiscordRPC._update_status("In-Game", "uton", "Undertale Online")
	#Server.ConnectToServer()
	Globals.limit_bottom = 0
	Globals.limit_left = 0
	Globals.limit_right = 2480
	Globals.limit_top = 0
	Globals.PlayerCanMove = 0
	add_child(GlobalScene_)
	$YSort.add_child(player_instance)
	var PlayerInPlayerScene = player_instance.get_node("Camera2D/AnimatedSprite")
	player_instance._which_sprite("front")
	if Globals.Spawn_loc == 0:
		player_instance.position = Vector2(-380.0, 0.0)
		GlobalScene_.position = Vector2(-380.0, 0.0)
	elif Globals.Spawn_loc == 1:
		player_instance.position = Vector2(551.0, 56.0)
		GlobalScene_.position = Vector2(551.0, 56.0)
	GameMusics.stop_all_themes()
	pass

func _process(delta):
	if get_node("Area2D2").get_overlapping_bodies().size() == 1:
		get_node("CanvasLayer/ColorRect/AnimationPlayer").play("FadeOut")
		Globals.Spawn_loc = 0
		Globals.PlayerCanMove = 1
		player_instance._which_sprite("back")
		pass

func _on_AnimationPlayer_animation_finished(FadeOut):
	if FadeOut == "FadeOut":
		get_tree().change_scene("res://Scenes/tscn/Room2.tscn")
	pass # Replace with function body.

func SpawnNewPlayer(player_id, spawn_position):
	if get_tree().get_network_unique_id() == player_id:
		pass
	else:
		var new_player = player_server.instance()
		new_player.position = spawn_position
		new_player.name = str(player_id)
		get_node("YSort/OtherPlayers").add_child(new_player)

func DespawnPlayer(player_id):
	get_node("YSort/OtherPlayers/" + str(player_id)).queue_free()

func UpdateWorldState(world_state):
	if world_state["T"] > last_world_state:
		last_world_state = world_state["T"]
		world_state.erase("T")
		world_state.erase(get_tree().get_network_unique_id())
		#if world_state.has(get_tree().get_current_scene().get_name()):
		for player in world_state.keys():
			if world_state[player]["R"] == get_tree().get_current_scene().get_name():
				if get_node("YSort/OtherPlayers").has_node(str(player)):
					get_node("YSort/OtherPlayers/" + str(player)).MovePlayer(world_state[player]["P"],get_tree().get_current_scene().get_name())
					get_node("YSort/OtherPlayers/" + str(player)).SetName(str(world_state[player]["N"]))
					get_node("YSort/OtherPlayers/" + str(player)).SetAnim(str(world_state[player]["AN"]), world_state[player]["AF"])
				else:
					SpawnNewPlayer(player, world_state[player]["P"])
			else:
				if get_node("YSort/OtherPlayers").has_node(str(player)):
					DespawnPlayer(player)
