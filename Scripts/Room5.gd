extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var lever1 = 0
var lever2 = 0
var switch1isflipped = 0
var readthesign1 = 0
var switch2isflipped = 0
var readthesign2 = 0
onready var DialogueBox__ = load("res://Scenes/tscn/DialogueBox.tscn").instance()
var GlobalScene_1 = load("res://Scenes/tscn/GlobalScene.tscn")
var GlobalScene_ = GlobalScene_1.instance()
onready var player_instance = load("res://Scenes/tscn/Player.tscn").instance()
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play('WaterAnim')
	$AnimatedSprite2.play('WaterAnim')
	Globals.limit_bottom = 420
	Globals.limit_left = -743
	Globals.limit_right = 1059
	Globals.limit_top = -90
	Globals.PlayerCanMove = 0
	add_child(player_instance)
	add_child(GlobalScene_)
	GameMusics.change_theme_ruins()
	var PlayerInPlayerScene = player_instance.get_node("Camera2D/AnimatedSprite")
	if Globals.Spawn_loc == 0:
	 player_instance.position = Vector2(-977.0, 34.0)
	 GlobalScene_.position = Vector2(-523.0, 230.0)
	 player_instance._which_sprite("back")
	if Globals.Spawn_loc == 1:
	 player_instance.position = Vector2(147, -91.0)
	 GlobalScene_.position = Vector2(-523.0, -400.0)
	 player_instance._which_sprite("left")
	 pass # Replace with function body.

func _process(delta):
	if get_node("Area2D2").get_overlapping_bodies().size() == 2:
		get_node("CanvasLayer/ColorRect/AnimationPlayer").play("FadeOut")
		Globals.Spawn_loc = 1
		Globals.Next_Room = 0
		Globals.PlayerCanMove = 1
		player_instance._which_sprite("front")
	if get_node("Area2D3").get_overlapping_bodies().size() == 2:
		get_node("CanvasLayer/ColorRect/AnimationPlayer").play("FadeOut")
		Globals.Spawn_loc = 0
		Globals.Next_Room = 1
		Globals.PlayerCanMove = 1
		player_instance._which_sprite("right")
	if get_node("Area2D6").get_overlapping_bodies().size() == 2 and Input.is_action_just_pressed("PCInteract"):
		if switch1isflipped == 0 and readthesign1 == 0:
			Globals.DialogueText = "Don't Flip This Switch."
			Globals.CharCount = 19
			Globals.which_character_dialogue = 3
			readthesign1 = 1
		elif switch1isflipped == 1 and readthesign1 == 1:
			Globals.DialogueText = "Didn't I tell you to not"
			Globals.CharCount = 19
			Globals.which_character_dialogue = 3
		elif switch1isflipped == 1 and readthesign1 == 0:
			Globals.DialogueText = "You were supposed to talk to me first...."
			Globals.CharCount = 34
			Globals.which_character_dialogue = 3
		GlobalScene_.get_node("KinematicBody2D").DialogueBox(1, "bottom")
		GlobalScene_.get_node("KinematicBody2D").start_dialogue()
	if get_node("Area2D7").get_overlapping_bodies().size() == 2 and Input.is_action_just_pressed("PCInteract"):
		if switch2isflipped == 0 and readthesign2 == 0:
			Globals.DialogueText = "Flip This Switch."
			Globals.CharCount = 12
			Globals.which_character_dialogue = 3
			readthesign2 = 1
		elif switch2isflipped == 1 and readthesign2 == 1:
			Globals.DialogueText = "I wasn't talking to you."
			Globals.CharCount = 19
			Globals.which_character_dialogue = 3
		elif switch2isflipped == 1 and readthesign2 == 0:
			Globals.DialogueText = "Thanks."
			Globals.CharCount = 4
			Globals.which_character_dialogue = 3
		GlobalScene_.get_node("KinematicBody2D").DialogueBox(1, "bottom")
		GlobalScene_.get_node("KinematicBody2D").start_dialogue()
	if get_node("Area2D8").get_overlapping_bodies().size() == 2 and Input.is_action_just_pressed("PCInteract"):
		GlobalScene_.get_node("KinematicBody2D").DialogueBox(1, "bottom")
		Globals.DialogueText = "* The switch is broken."
		Globals.CharCount = 17
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
	if get_node("Area2D4").get_overlapping_bodies().size() == 2 and Input.is_action_just_pressed("PCInteract"):
		leverpulldown()
	if get_node("Area2D5").get_overlapping_bodies().size() == 2 and Input.is_action_just_pressed("PCInteract"):
		leverpulldown2()
		pass

func _on_AnimationPlayer_animation_finished(FadeOut):
	if FadeOut == "FadeOut":
		if Globals.Next_Room == 0:
			get_tree().change_scene("res://Scenes/tscn/Room4.tscn")
		if Globals.Next_Room == 1:
			get_tree().change_scene("res://Scenes/tscn/Room6.tscn")
	pass # Replace with function body.

func leverpulldown():
	switch1isflipped = 1
	if lever1 == 0:
		$Area2D4/AnimatedSprite.play("1")
		$AudioStreamPlayer2D.play()
		lever1 = 1
	elif lever1 == 1:
		$Area2D4/AnimatedSprite.play("2")
		$AudioStreamPlayer2D.play()
		lever1 = 0

func leverpulldown2():
	switch2isflipped = 1
	if lever2 == 0:
		$Area2D5/AnimatedSprite.play("1")
		$AudioStreamPlayer2D.play()
		lever2 = 1
	elif lever2 == 1:
		$Area2D5/AnimatedSprite.play("2")
		$AudioStreamPlayer2D.play()
		lever2 = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
