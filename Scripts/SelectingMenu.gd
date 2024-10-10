extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var select = 0
var which_room = 0
var fade_done = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	DiscordRPC._update_status("User Infi", "uton", "Undertale Online")
	$Control/User2.text = UserUn.Username
	pass # Replace with function body.

func _process(delta):
	if Globals.player_character1 == 0:
		$Control/Panel/AnimatedSprite.play("Frisk")
	elif Globals.player_character1 == 1:
		$Control/Panel/AnimatedSprite.play("Samuel")
	elif Globals.player_character1 == 4:
		$Control/Panel/AnimatedSprite.play("Chris")
	elif Globals.player_character1 == 5:
		$Control/Panel/AnimatedSprite.play("Chara")
	elif Globals.player_character1 == 256:
		$Control/Panel/AnimatedSprite.play("RobTopFreak")
	if select == 3:
		select = 0
	elif select == -1:
		select = 2
	if Input.is_action_just_pressed("ui_down"):
		select += 1
		$AudioStreamPlayer2D.play()
	elif Input.is_action_just_pressed("ui_up"):
		select -= 1
		$AudioStreamPlayer2D.play()
	if select == 0:
		$Play.add_color_override("font_color", Color(255,255,0,255))
		$Settings.add_color_override("font_color", Color(255,255,255,255))
		$Controls.add_color_override("font_color", Color(255,255,255,255))
	elif select == 1:
		$Play.add_color_override("font_color", Color(255,255,255,255))
		$Settings.add_color_override("font_color", Color(255,255,0,255))
		$Controls.add_color_override("font_color", Color(255,255,255,255))
	if select == 2:
		$Play.add_color_override("font_color", Color(255,255,255,255))
		$Settings.add_color_override("font_color", Color(255,255,255,255))
		$Controls.add_color_override("font_color", Color(255,255,0,255))
	if fade_done == 1:
		if select == 0 and Input.is_action_just_pressed("PCInteract"):
			$ColorRect/AnimationPlayer.play("FadeOut")
			which_room = 0
			$Play.hide()
			$Settings.hide()
			$Controls.hide()
			$AudioStreamPlayer2D2.play()
			$White1.show()
			$White2.hide()
			$White3.hide()
			select = 4
		elif select == 1 and Input.is_action_just_pressed("PCInteract"):
			$ColorRect/AnimationPlayer.play("FadeOut")
			which_room = 1
			$Play.hide()
			$Settings.hide()
			$Controls.hide()
			$White1.hide()
			$White2.show()
			$White3.hide()
			select = 4
			$AudioStreamPlayer2D2.play()
		elif select == 2 and Input.is_action_just_pressed("PCInteract"):
			$ColorRect/AnimationPlayer.play("FadeOut")
			which_room = 2
			$Play.hide()
			$Settings.hide()
			$Controls.hide()
			$White1.hide()
			$White2.hide()
			$White3.show()
			$AudioStreamPlayer2D2.play()
			select = 4
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "FadeIn":
		fade_done = 1
	if anim_name == "FadeOut":
		if which_room == 0:
			get_tree().change_scene("res://Scenes/tscn/SelectingMenu2.tscn")
		elif which_room == 1:
			get_tree().change_scene("res://Scenes/tscn/Settings.tscn")
		elif which_room == 2:
			get_tree().change_scene("res://Scenes/tscn/Controls.tscn")
	pass # Replace with function body.
