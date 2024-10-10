extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var letters = 0
var letters2 = 0
var music_play = 0
var play_once = 0
var which_music = 0
var Music_OST = ""
var Author_Name = ""
var next_music = 0
var toptext = "While you're off, We'll play you some music"
var run_toptext = 0
var start_music = 0
var connected_once = 0
var last_numbers = []
var rng = RandomNumberGenerator.new()
var max_songs = 7

# Called when the node enters the scene tree for the first time.
func _ready():
	_random_music()
	CheckNConnection.connect("connection_success", self, "_on_success")
	$AnimatedSprite.play('3')
	$Control/Label8.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _process(_delta):
	if last_numbers.size() == max_songs:
		last_numbers.clear()
	if start_music > 1:
		if music_play > 600:
			$Control/Label3.set_visible_characters(letters2)
			$Control/Label4.set_visible_characters(letters2)
			$Control/Label5.set_visible_characters(letters2)
			if run_toptext == 0:
				letters2 = 0
				toptext = "While you're off, We'll play you some music"
				run_toptext = 1
				$Control/Label3/AnimationPlayer.play("FadeIn")
			if play_once == 0:
				_play_music(which_music)
				pass

func _play_music(num):
	if num == 0:
		$Control/Core.play()
		$Control/Label4/AnimationPlayer.play("FadeIn")
		$Control/Label6.text = "Core"
		$Control/Label7.text = "Toby Fox"
		$Control/Label5/AnimationPlayer.play("FadeIn")
		$Control/Label6/AnimationPlayer.play("FadeIn")
		$Control/Label7/AnimationPlayer.play("FadeIn")
	elif num == 1:
		$Control/Snowdin_Shop.play()
		$Control/Label4/AnimationPlayer.play("FadeIn")
		$Control/Label6.text = "Shop (Snowdin)"
		$Control/Label7.text = "Toby Fox"
		$Control/Label5/AnimationPlayer.play("FadeIn")
		$Control/Label6/AnimationPlayer.play("FadeIn")
		$Control/Label7/AnimationPlayer.play("FadeIn")
	elif num == 2:
		$Control/Lab.play()
		$Control/Label4/AnimationPlayer.play("FadeIn")
		$Control/Label6.text = "Lab"
		$Control/Label7.text = "Toby Fox"
		$Control/Label5/AnimationPlayer.play("FadeIn")
		$Control/Label6/AnimationPlayer.play("FadeIn")
		$Control/Label7/AnimationPlayer.play("FadeIn")
	elif num == 3:
		$Control/TrueLab.play()
		$Control/Label4/AnimationPlayer.play("FadeIn")
		$Control/Label6.text = "Here We Are"
		$Control/Label7.text = "Toby Fox"
		$Control/Label5/AnimationPlayer.play("FadeIn")
		$Control/Label6/AnimationPlayer.play("FadeIn")
		$Control/Label7/AnimationPlayer.play("FadeIn")
	elif num == 4:
		$Control/UwaSoTemprate.play()
		$Control/Label4/AnimationPlayer.play("FadeIn")
		$Control/Label6.text = "Uwa!! So Temperate"
		$Control/Label7.text = "Toby Fox"
		$Control/Label5/AnimationPlayer.play("FadeIn")
		$Control/Label6/AnimationPlayer.play("FadeIn")
		$Control/Label7/AnimationPlayer.play("FadeIn")
	elif num == 5:
		$Control/Home.play()
		$Control/Label4/AnimationPlayer.play("FadeIn")
		$Control/Label6.text = "Home"
		$Control/Label7.text = "Toby Fox"
		$Control/Label5/AnimationPlayer.play("FadeIn")
		$Control/Label6/AnimationPlayer.play("FadeIn")
		$Control/Label7/AnimationPlayer.play("FadeIn")
	elif num == 6:
		$Control/Waterfall.play()
		$Control/Label4/AnimationPlayer.play("FadeIn")
		$Control/Label6.text = "Waterfall"
		$Control/Label7.text = "Toby Fox"
		$Control/Label5/AnimationPlayer.play("FadeIn")
		$Control/Label6/AnimationPlayer.play("FadeIn")
		$Control/Label7/AnimationPlayer.play("FadeIn")
	elif num == 7:
		$Control/AnotherMedium.play()
		$Control/Label4/AnimationPlayer.play("FadeIn")
		$Control/Label6.text = "Another Medium"
		$Control/Label7.text = "Toby Fox"
		$Control/Label5/AnimationPlayer.play("FadeIn")
		$Control/Label6/AnimationPlayer.play("FadeIn")
		$Control/Label7/AnimationPlayer.play("FadeIn")
	play_once = 1
	pass

var sus = 99

func _random_music():
	rng.randomize()
	sus = rng.randi_range(0, max_songs)
	if !last_numbers.has(sus):
		which_music = sus
		last_numbers.append(which_music)
	elif last_numbers.has(sus):
		_random_music()
		pass

func _on_success():
	if connected_once == 0:
		$Control/Label.hide()
		$Control/Label2.hide()
		$Control/Label3.hide()
		$Control/Label4.hide()
		$Control/Label5.hide()
		$Control/Label6.hide()
		$Control/Label7.hide()
		$Control/Label8.show()
		$Control/Connected.play()
		get_node("ColorRect/AnimationPlayer").play("FadeOut")
		connected_once = 1
		pass

func _on_Timer_timeout():
	letters = letters + 1
	pass # Replace with function body.

func _on_Timer2_timeout():
	letters2 = letters2 + 1
	pass # Replace with function body.

func _on_Timer_2_timeout():
	music_play = music_play + 1
	start_music = start_music + 1
	pass # Replace with function body.

func _on_AnimationPlayer_animation_finished(FadeOut):
	if FadeOut == "FadeOut":
		get_tree().change_scene("res://Scenes/tscn/MainMenu.tscn")
	pass # Replace with function body.

func next_music():
	_random_music()
	music_play = 0
	play_once = 0
	$Control/Label4/AnimationPlayer.play("FadeOut")
	$Control/Label5/AnimationPlayer.play("FadeOut")
	$Control/Label6/AnimationPlayer.play("FadeOut")
	$Control/Label7/AnimationPlayer.play("FadeOut")
	pass

func _on_Music_finished():
	next_music()
	pass # Replace with function body.
