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
	Globals.limit_left = -318
	Globals.limit_right = 2405
	Globals.limit_top = -90
	Globals.PlayerCanMove = 0
	add_child(player_instance)
	add_child(GlobalScene_)
	GameMusics.change_theme_ruins()
	var PlayerInPlayerScene = player_instance.get_node("Camera2D/AnimatedSprite")
	if Globals.Spawn_loc == 0:
	 player_instance.position = Vector2(-508.0, 24.0)
	 GlobalScene_.position = Vector2(-523.0, 230.0)
	 player_instance._which_sprite("back")
	if Globals.Spawn_loc == 1:
	 player_instance.position = Vector2(167, -91)
	 GlobalScene_.position = Vector2(-523.0, -400.0)
	 player_instance._which_sprite("left")
	 pass # Replace with function body.

func _process(delta):
	if get_node("Control/3").get_overlapping_bodies().size() == 2:
		$AnimatedSprite3.play('2')
	if get_node("Control/4").get_overlapping_bodies().size() == 2:
		$AnimatedSprite4.play('2')
	if get_node("Control/7").get_overlapping_bodies().size() == 2:
		$AnimatedSprite7.play('2')
	if get_node("Control/8").get_overlapping_bodies().size() == 2:
		$AnimatedSprite8.play('2')
	if get_node("Control/9").get_overlapping_bodies().size() == 2:
		$AnimatedSprite9.play('2')
	if get_node("Control/10").get_overlapping_bodies().size() == 2:
		$AnimatedSprite10.play('2')
	if get_node("Control/11").get_overlapping_bodies().size() == 2:
		$AnimatedSprite11.play('2')
	if get_node("Control/12").get_overlapping_bodies().size() == 2:
		$AnimatedSprite12.play('2')
	if get_node("Control/13").get_overlapping_bodies().size() == 2:
		$AnimatedSprite13.play('2')
	if get_node("Control/14").get_overlapping_bodies().size() == 2:
		$AnimatedSprite14.play('2')
	if get_node("Control/15").get_overlapping_bodies().size() == 2:
		$AnimatedSprite15.play('2')
	if get_node("Control/16").get_overlapping_bodies().size() == 2:
		$AnimatedSprite16.play('2')
	if get_node("Control/17").get_overlapping_bodies().size() == 2:
		$AnimatedSprite17.play('2')
	if get_node("Control/18").get_overlapping_bodies().size() == 2:
		$AnimatedSprite21.play('2')
	if get_node("Control/21").get_overlapping_bodies().size() == 2:
		$AnimatedSprite21.play('2')
	if get_node("Control/22").get_overlapping_bodies().size() == 2:
		$AnimatedSprite22.play('2')
	if get_node("Control/23").get_overlapping_bodies().size() == 2:
		$AnimatedSprite23.play('2')
	if get_node("Control/24").get_overlapping_bodies().size() == 2:
		$AnimatedSprite24.play('2')
	if get_node("Control/25").get_overlapping_bodies().size() == 2:
		$AnimatedSprite25.play('2')
	if get_node("Control/26").get_overlapping_bodies().size() == 2:
		$AnimatedSprite26.play('2')
	if get_node("Control/27").get_overlapping_bodies().size() == 2:
		$AnimatedSprite27.play('2')
	if get_node("Control/28").get_overlapping_bodies().size() == 2:
		$AnimatedSprite28.play('2')
	if get_node("Control/31").get_overlapping_bodies().size() == 2:
		$AnimatedSprite31.play('2')
	if get_node("Control/32").get_overlapping_bodies().size() == 2:
		$AnimatedSprite32.play('2')
	if get_node("Control/35").get_overlapping_bodies().size() == 2:
		$AnimatedSprite35.play('2')
	if get_node("Control/36").get_overlapping_bodies().size() == 2:
		$AnimatedSprite36.play('2')
	if get_node("Control/39").get_overlapping_bodies().size() == 2:
		$AnimatedSprite39.play('2')
	if get_node("Control/40").get_overlapping_bodies().size() == 2:
		$AnimatedSprite40.play('2')
	if get_node("Control/41").get_overlapping_bodies().size() == 2:
		$AnimatedSprite41.play('2')
	if get_node("Control/42").get_overlapping_bodies().size() == 2:
		$AnimatedSprite42.play('2')
	if get_node("Control/43").get_overlapping_bodies().size() == 2:
		$AnimatedSprite43.play('2')
	if get_node("Control/44").get_overlapping_bodies().size() == 2:
		$AnimatedSprite44.play('2')
	if get_node("Control/45").get_overlapping_bodies().size() == 2:
		$AnimatedSprite45.play('2')
	if get_node("Control/46").get_overlapping_bodies().size() == 2:
		$AnimatedSprite46.play('2')
	if get_node("Control/47").get_overlapping_bodies().size() == 2:
		$AnimatedSprite47.play('2')
	if get_node("Control/48").get_overlapping_bodies().size() == 2:
		$AnimatedSprite48.play('2')
	if get_node("Control/49").get_overlapping_bodies().size() == 2:
		$AnimatedSprite49.play('2')
	if get_node("Control/50").get_overlapping_bodies().size() == 2:
		$AnimatedSprite50.play('2')
	if get_node("Control/53").get_overlapping_bodies().size() == 2:
		$AnimatedSprite53.play('2')
	if get_node("Control/54").get_overlapping_bodies().size() == 2:
		$AnimatedSprite54.play('2')
	if get_node("Control/3").get_overlapping_bodies().size() == 1:
		$AnimatedSprite3.play('1')
	if get_node("Control/4").get_overlapping_bodies().size() == 1:
		$AnimatedSprite4.play('1')
	if get_node("Control/7").get_overlapping_bodies().size() == 1:
		$AnimatedSprite7.play('1')
	if get_node("Control/8").get_overlapping_bodies().size() == 1:
		$AnimatedSprite8.play('1')
	if get_node("Control/9").get_overlapping_bodies().size() == 1:
		$AnimatedSprite9.play('1')
	if get_node("Control/10").get_overlapping_bodies().size() == 1:
		$AnimatedSprite10.play('1')
	if get_node("Control/11").get_overlapping_bodies().size() == 1:
		$AnimatedSprite11.play('1')
	if get_node("Control/12").get_overlapping_bodies().size() == 1:
		$AnimatedSprite12.play('1')
	if get_node("Control/13").get_overlapping_bodies().size() == 1:
		$AnimatedSprite13.play('1')
	if get_node("Control/14").get_overlapping_bodies().size() == 1:
		$AnimatedSprite14.play('1')
	if get_node("Control/15").get_overlapping_bodies().size() == 1:
		$AnimatedSprite15.play('1')
	if get_node("Control/16").get_overlapping_bodies().size() == 1:
		$AnimatedSprite16.play('1')
	if get_node("Control/17").get_overlapping_bodies().size() == 1:
		$AnimatedSprite17.play('1')
	if get_node("Control/18").get_overlapping_bodies().size() == 1:
		$AnimatedSprite18.play('1')
	if get_node("Control/21").get_overlapping_bodies().size() == 1:
		$AnimatedSprite21.play('1')
	if get_node("Control/22").get_overlapping_bodies().size() == 1:
		$AnimatedSprite22.play('1')
	if get_node("Control/23").get_overlapping_bodies().size() == 1:
		$AnimatedSprite23.play('1')
	if get_node("Control/24").get_overlapping_bodies().size() == 1:
		$AnimatedSprite24.play('1')
	if get_node("Control/25").get_overlapping_bodies().size() == 1:
		$AnimatedSprite25.play('1')
	if get_node("Control/26").get_overlapping_bodies().size() == 1:
		$AnimatedSprite26.play('1')
	if get_node("Control/27").get_overlapping_bodies().size() == 1:
		$AnimatedSprite27.play('1')
	if get_node("Control/28").get_overlapping_bodies().size() == 1:
		$AnimatedSprite28.play('1')
	if get_node("Control/31").get_overlapping_bodies().size() == 1:
		$AnimatedSprite31.play('1')
	if get_node("Control/32").get_overlapping_bodies().size() == 1:
		$AnimatedSprite32.play('1')
	if get_node("Control/35").get_overlapping_bodies().size() == 1:
		$AnimatedSprite35.play('1')
	if get_node("Control/36").get_overlapping_bodies().size() == 1:
		$AnimatedSprite36.play('1')
	if get_node("Control/39").get_overlapping_bodies().size() == 1:
		$AnimatedSprite39.play('1')
	if get_node("Control/40").get_overlapping_bodies().size() == 1:
		$AnimatedSprite40.play('1')
	if get_node("Control/41").get_overlapping_bodies().size() == 1:
		$AnimatedSprite41.play('1')
	if get_node("Control/42").get_overlapping_bodies().size() == 1:
		$AnimatedSprite42.play('1')
	if get_node("Control/43").get_overlapping_bodies().size() == 1:
		$AnimatedSprite43.play('1')
	if get_node("Control/44").get_overlapping_bodies().size() == 1:
		$AnimatedSprite44.play('1')
	if get_node("Control/45").get_overlapping_bodies().size() == 1:
		$AnimatedSprite45.play('1')
	if get_node("Control/46").get_overlapping_bodies().size() == 1:
		$AnimatedSprite46.play('1')
	if get_node("Control/47").get_overlapping_bodies().size() == 1:
		$AnimatedSprite47.play('1')
	if get_node("Control/49").get_overlapping_bodies().size() == 1:
		$AnimatedSprite49.play('1')
	if get_node("Control/48").get_overlapping_bodies().size() == 1:
		$AnimatedSprite48.play('1')
	if get_node("Control/50").get_overlapping_bodies().size() == 1:
		$AnimatedSprite50.play('1')
	if get_node("Control/53").get_overlapping_bodies().size() == 1:
		$AnimatedSprite53.play('1')
	if get_node("Control/54").get_overlapping_bodies().size() == 1:
		$AnimatedSprite54.play('1')
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
		player_instance._which_sprite("right")
	if get_node("Area2D4").get_overlapping_bodies().size() == 2 and Input.is_action_just_pressed("PCInteract"):
		Globals.DialogueText = "* The light opens your path."
		Globals.CharCount = 20
		Globals.which_character_dialogue = 3
		GlobalScene_.get_node("KinematicBody2D").DialogueBox(1, "bottom")
		GlobalScene_.get_node("KinematicBody2D").start_dialogue()
		pass

func _on_AnimationPlayer_animation_finished(FadeOut):
	if FadeOut == "FadeOut":
		if Globals.Next_Room == 0:
			get_tree().change_scene("res://Scenes/tscn/Room6.tscn")
		elif Globals.Next_Room == 1:
			get_tree().change_scene("res://Scenes/tscn/Room8.tscn")
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
