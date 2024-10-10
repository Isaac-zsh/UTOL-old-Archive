extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var DialogueBox__ = load("res://Scenes/tscn/DialogueBox.tscn").instance()
var GlobalScene_1 = load("res://Scenes/tscn/GlobalScene.tscn")
var GlobalScene_ = GlobalScene_1.instance()
onready var player_instance = load("res://Scenes/tscn/Player.tscn").instance()
# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.limit_bottom = 440
	Globals.limit_left = 0
	Globals.limit_right = 640
	Globals.limit_top = -90
	Globals.PlayerCanMove = 0
	add_child(player_instance)
	add_child(GlobalScene_)
	GameMusics.change_theme_ruins()
	var PlayerInPlayerScene = player_instance.get_node("Camera2D/AnimatedSprite")
	if Globals.Spawn_loc == 0:
	 player_instance.position = Vector2(-787.0, -84.0)
	 GlobalScene_.position = Vector2(-523.0, 230.0)
	 player_instance._which_sprite("right")
	if Globals.Spawn_loc == 1:
	 player_instance.position = Vector2(-523.0, -236.0)
	 GlobalScene_.position = Vector2(-523.0, -400.0)
	 player_instance._which_sprite("front")
	 pass # Replace with function body.

func _process(delta):
	if get_node("Area2D2").get_overlapping_bodies().size() == 2:
		get_node("CanvasLayer/ColorRect/AnimationPlayer").play("FadeOut")
		Globals.Spawn_loc = 1
		Globals.Next_Room = 0
		Globals.PlayerCanMove = 1
		player_instance._which_sprite("left")
	elif get_node("Area2D3").get_overlapping_bodies().size() == 2:
		get_node("CanvasLayer/ColorRect/AnimationPlayer").play("FadeOut")
		Globals.Spawn_loc = 0
		Globals.Next_Room = 1
		Globals.PlayerCanMove = 1
		player_instance._which_sprite("right")
	elif get_node("Area2D5").get_overlapping_bodies().size() == 1:
		get_node("CanvasLayer/ColorRect/AnimationPlayer").play("FadeOut")
		Globals.Spawn_loc = 0
		Globals.Next_Room = 2
		Globals.PlayerCanMove = 1
		player_instance._which_sprite("back")
	if get_node("Area2D4").get_overlapping_bodies().size() == 2 and Input.is_action_just_pressed("PCInteract"):
		Globals.DialogueText = "It's a Dummy, but..."
		Globals.CharCount = 16
		GlobalScene_.get_node("KinematicBody2D").DialogueBox(1, "bottom")
		GlobalScene_.get_node("KinematicBody2D").start_dialogue()
		pass

func _on_AnimationPlayer_animation_finished(FadeOut):
	if FadeOut == "FadeOut":
		if Globals.Next_Room == 0:
			get_tree().change_scene("res://Scenes/tscn/Room5.tscn")
		elif Globals.Next_Room == 1:
			get_tree().change_scene("res://Scenes/tscn/Room6.tscn")
		elif Globals.Next_Room == 2:
			get_tree().change_scene("res://Scenes/tscn/Room7.tscn")
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
