extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var do_once = 0
var what_to_fetch = 0
var delay = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Control/Control/Frisk.play()
	OS.set_window_title("Undertale Online (Fetching Data)")
	pass # Replace with function body.

func _process(delta):
	GameJoltApi.what_to_do = 0
	if what_to_fetch == 0:
		GameJoltApi.fetch_data_user("skin", false)
		$Label.text = "Fetching User's Skins..."
		what_to_fetch += 1
	elif what_to_fetch == 1:
		if Globals.player_character != 9999999999:
			$Control/Control/TextureProgress.value += 20
			what_to_fetch += 1
	elif what_to_fetch == 2:
		GameJoltApi.fetch_data_user("hp", false)
		$Label.text = "Fetching User's HP..."
		what_to_fetch += 1
	elif what_to_fetch == 3:
		if Globals.hp != 9999999999:
			$Control/Control/TextureProgress.value += 20
			what_to_fetch += 1
	elif what_to_fetch == 4:
		GameJoltApi.fetch_data_user("df", false)
		$Label.text = "Fetching User's DF..."
		what_to_fetch += 1
	elif what_to_fetch == 5:
		if Globals.df != 9999999999:
			$Control/Control/TextureProgress.value += 20
			what_to_fetch += 1
	elif what_to_fetch == 6:
		GameJoltApi.fetch_data_user("lv", false)
		$Label.text = "Fetching User's LV..."
		what_to_fetch += 1
	elif what_to_fetch == 7:
		if Globals.lv != 9999999999:
			$Control/Control/TextureProgress.value += 20
			what_to_fetch += 1
	elif what_to_fetch == 8:
		GameJoltApi.fetch_data_user("gold", false)
		$Label.text = "Fetching User's GOLD..."
		what_to_fetch += 1
	elif what_to_fetch == 9:
		if Globals.gold != 9999999999:
			$Control/Control/TextureProgress.value += 20
			what_to_fetch += 1
	if $Control/Control/TextureProgress.value > 99:
		if do_once == 0:
			$Label.text = "Done!"
			$AudioStreamPlayer2D3.play()
			$ColorRect/AnimationPlayer.play("FadeOut")
			do_once = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "FadeOut":
		get_tree().change_scene("res://Scenes/tscn/Room1.tscn")
	pass # Replace with function body.


func _on_Timer_timeout():
	delay += 1
	pass # Replace with function body.
