extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _ready() -> void:
	DiscordRPC._update_status("Main Menu", "uton", "Undertale Online")
	pass

# Called when the node enters the scene tree for the first time.
func _input(event):
	if Input.is_action_just_pressed("PCInteract") and !get_node("ColorRect/AnimationPlayer").is_playing():
		get_node("ColorRect/AnimationPlayer").play("UnFade")
		get_node("MMSelect").play()
	#elif Input.is_action_pressed("PCInteract") and 
	elif Input.is_action_just_pressed("CodesMenu"):
		get_tree().change_scene("res://Scenes/tscn/CodesMenu.tscn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_AnimationPlayer_animation_finished(UnFade):
	if UnFade == "UnFade":
		get_tree().change_scene("res://Scenes/tscn/AccountSelectorN.tscn")
	pass # Replace with function body.
