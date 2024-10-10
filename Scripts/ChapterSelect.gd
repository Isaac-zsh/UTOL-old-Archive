extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var can_play_ch1 = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("PCInteract"):
		if can_play_ch1 == true:
			$ColorRect/AnimationPlayer.play("FadeOut")
			$AudioStreamPlayer2D3.play()
			can_play_ch1 = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Slide_animation_finished(anim_name):
	if anim_name == "slide":
		can_play_ch1 = true
		#$VoidSound.play()
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "FadeOut":
		print("e")
	pass # Replace with function body.
