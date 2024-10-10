extends Node2D

var game_version_id = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	DiscordRPC._update_status("Checking Game Version...", "uton", "Undertale Online")
	$GameJoltAPI.init("102984c886d1ed359f6ed5df2a281869", 630718)
	$GameJoltAPI.fetch_data("game_version_id", true)
	$AnimatedSprite.play('2')
	pass # Replace with function body.

func _on_GameJoltAPI_gamejolt_request_completed(type, message, finished):
	if type=="/data-store/":
		if message["success"]:
			#fetched data
			if game_version_id == int(message["data"]):
				$CGV.hide()
				$Status.show()
				$Status.text = "Game is Latest Version!"
				$Connected.play()
				$ColorRect/AnimationPlayer.play("FadeOut")
			elif game_version_id != int(message["data"]):
				$CGV.hide()
				$Status.show()
				$Status.text = "This Version of the game is Outdated, Please Update the Latest Version."

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "FadeOut":
		get_tree().change_scene("res://Scenes/tscn/MainMenu.tscn")
	pass # Replace with function body.
