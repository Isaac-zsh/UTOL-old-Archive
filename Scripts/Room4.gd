extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var SoundPlayTimes = 0
var Button1Pressed = 0
var Button2Pressed = 0
onready var GlobalScene_ = load("res://Scenes/tscn/GlobalScene.tscn").instance()
onready var DialogueBox__ = load("res://Scenes/tscn/DialogueBox.tscn").instance()
onready var player_instance = load("res://Scenes/tscn/Player.tscn").instance()
# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.limit_bottom = 450
	Globals.limit_left = 0
	Globals.limit_right = 643
	Globals.limit_top = -88
	Globals.PlayerCanMove = 0
	var TouchControls = load("res://Singletones/TouchControls.tscn").instance()
	add_child(player_instance)
	add_child(GlobalScene_)
	GameMusics.change_theme_ruins()
	var PlayerInPlayerScene = player_instance.get_node("Camera2D/AnimatedSprite")
	if Globals.Spawn_loc == 0:
	 player_instance.position = Vector2(-523.0, 30.0)
	 GlobalScene_.position = Vector2(-523.0, 230.0)
	 player_instance._which_sprite("back")
	if Globals.Spawn_loc == 1:
	 player_instance.position = Vector2(-523.0, -400.0)
	 GlobalScene_.position = Vector2(-523.0, -400.0)
	 player_instance._which_sprite("front")
	if Globals.Spawn_loc == 1:
	 player_instance.position = Vector2(-563.0, -230.0)
	 GlobalScene_.position = Vector2(-563.0, -230.0)
	 PlayerInPlayerScene.play("left-idle")
	 pass # Replace with function body.

func _process(delta):
	if get_node("Area2D2").get_overlapping_bodies().size() == 2:
		get_node("CanvasLayer/ColorRect/AnimationPlayer").play("FadeOut")
		Globals.Spawn_loc = 1
		Globals.Next_Room = 0
		Globals.PlayerCanMove = 1
		player_instance._which_sprite("front")
	elif get_node("Area2D3").get_overlapping_bodies().size() == 2:
		get_node("CanvasLayer/ColorRect/AnimationPlayer").play("FadeOut")
		Globals.Spawn_loc = 0
		Globals.Next_Room = 1
		Globals.PlayerCanMove = 1
		player_instance._which_sprite("back")
	elif get_node("Area2D4").get_overlapping_bodies().size() == 2 and Input.is_action_just_pressed("PCInteract"):
		GlobalScene_.get_node("KinematicBody2D").DialogueBox(1, "bottom")
		Globals.DialogueText = "* It's stuck"
		Globals.CharCount = 8
		if Globals.player_character == 0:
			Globals.which_character_dialogue = 0
		if Globals.player_character == 1:
			Globals.which_character_dialogue = 1
		if Globals.player_character == 4:
			Globals.which_character_dialogue = 4
		if Globals.player_character == 5:
			Globals.which_character_dialogue = 5
		if Globals.player_character == 256:
			Globals.which_character_dialogue = 256
		GlobalScene_.get_node("KinematicBody2D").start_dialogue()
		pass
	elif get_node("Area2D5").get_overlapping_bodies().size() == 2 and Input.is_action_just_pressed("PCInteract"):
		GlobalScene_.get_node("KinematicBody2D").DialogueBox(1, "bottom")
		Globals.DialogueText = "Welcome To The Underground, You may procced through the door."
		Globals.CharCount = 52
		Globals.which_character_dialogue = 2
		GlobalScene_.get_node("KinematicBody2D").start_dialogue()
		pass
	elif get_node("Button1Collider").get_overlapping_bodies().size() == 1 and Button1Pressed == 0:
		get_node("Area2D/CollisionShape2D/AnimatedSprite").play("Pressed")
		$AudioStreamPlayer2D.play()
		SoundPlayTimes = 1
		Button1Pressed = 1
	elif get_node("Button2Collider").get_overlapping_bodies().size() == 1 and Button2Pressed == 0:
		get_node("Area2D/CollisionShape2D/AnimatedSprite2").play("Pressed")
		$AudioStreamPlayer2D.play()
		SoundPlayTimes = 1
		Button2Pressed = 1
		pass

func _on_AnimationPlayer_animation_finished(FadeOut):
	if FadeOut == "FadeOut":
		if Globals.Next_Room == 0:
			get_tree().change_scene("res://Scenes/tscn/Room3.tscn")
		if Globals.Next_Room == 1:
			get_tree().change_scene("res://Scenes/tscn/Room5.tscn")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
