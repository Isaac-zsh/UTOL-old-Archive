extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	GameMusics.position = get_node("..").position
func change_theme_ruins():
	GameMusics.get_node("RuinsMusic").play()
	Globals.RuinsMusicPlaying = 1

func stop_all_themes():
	GameMusics.get_node("RuinsMusic").stop()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
