extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var hurt_sfx = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _play_hurt_sfx():
	if hurt_sfx == 0:
		$HurtSFX.play()
		hurt_sfx = 1

func change_theme_ruins():
	if Globals.RuinsMusicPlaying == 0:
		$RuinsMusic.play()
		Globals.RuinsMusicPlaying = 1

func stop_all_themes():
	if Globals.RuinsMusicPlaying == 1:
		$RuinsMusic.stop()
		Globals.RuinsMusicPlaying = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
