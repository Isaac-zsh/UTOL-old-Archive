extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# Called when the node enters the scene tree for the first time.
func _ready():
	DiscordRPC._update_status("Controls", "uton", "Undertale Online")
	$AnimatedSprite.play('1')
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("PCInteract"):
		$ColorRect/AnimationPlayer.play("FadeOut")
		$AudioStreamPlayer2D2.play()

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "FadeOut":
		get_tree().change_scene("res://Scenes/tscn/SelectingMenu.tscn")
	pass # Replace with function body.
