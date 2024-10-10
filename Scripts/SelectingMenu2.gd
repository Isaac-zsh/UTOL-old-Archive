extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var which_to_select = 0
var which_select1 = 0
var which_select2 = 0
var which_select3 = 0
var which_select4 = 0
var which_room = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	DiscordRPC._update_status("Selecting Game Mode", "uton", "Undertale Online")
	$AnimatedSprite.play('1')
	pass # Replace with function body.

func _process(delta):
	if which_select1 == -1:
		which_select1 = 2
	elif which_select1 == 3:
		which_select1 = 0
	if which_select2 == -1:
		which_select2 = 2
	elif which_select2 == 3:
		which_select2 = 0
	if which_to_select == 0:
		if which_select1 == 0:
			$Control/Label2/AnimationPlayer.play("OnlineYellow")
		elif which_select1 == 1:
			$Control/Label2/AnimationPlayer.play("StoryYellow")
		elif which_select1 == 2:
			$Control/Label2/AnimationPlayer.play("ExtrasYellow")
		if Input.is_action_just_pressed("ui_down"):
			which_select1 += 1
			$AudioStreamPlayer2D.play()
		elif Input.is_action_just_pressed("ui_up"):
			which_select1 -= 1
		if Input.is_action_just_pressed("PCInteract"):
			if which_select1 == 0:
				which_to_select = 4
				$AudioStreamPlayer2D2.play()
				$Control/Label2/AnimationPlayer.play("Out")
	elif which_to_select == 1:
		if which_select2 == 0:
			$Control/Label2/AnimationPlayer.play("PlayYellow")
		elif which_select2 == 1:
			$Control/Label2/AnimationPlayer.play("UnderNetYellow")
		elif which_select2 == 2:
			$Control/Label2/AnimationPlayer.play("StatsYellow")
		if Input.is_action_just_pressed("ui_right"):
			which_select2 += 1
			$AudioStreamPlayer2D.play()
		elif Input.is_action_just_pressed("ui_left"):
			which_select2 -= 1
			$AudioStreamPlayer2D.play()
		if Input.is_action_just_pressed("ui_running"):
			which_to_select = 4
			if which_select2 == 0:
				$Control/Label2/AnimationPlayer.play("OutReversed")
			elif which_select2 == 1:
				$Control/Label2/AnimationPlayer.play("OutReversed1")
			elif which_select2 == 2:
				$Control/Label2/AnimationPlayer.play("OutReversed2")
		if Input.is_action_just_pressed("PCInteract"):
			if which_select2 == 0:
				which_room = 0
				$ColorRect/AnimationPlayer.play("FadeOut")
				$AudioStreamPlayer2D2.play()
				which_to_select = 10

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "OutReversed":
		which_to_select = 0
	elif anim_name == "OutReversed1":
		which_to_select = 0
	elif anim_name == "OutReversed2":
		which_to_select = 0
	if anim_name == "Out":
		which_to_select = 1
	if anim_name == "FadeOut":
		if which_room == 0:
				get_tree().change_scene("res://Scenes/tscn/FetchingData.tscn")
	pass # Replace with function body.
