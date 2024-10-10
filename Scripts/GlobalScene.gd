extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
  CheckNConnection.connect("error_connection_failed", self, "_on_failure")
  var DialogueBox = load("res://Scenes/tscn/DialogueBox.tscn").instance()
  add_child(DialogueBox)
  pass # Replace with function body.

func _on_failure(code, message):
	get_tree().change_scene("res://Scenes/tscn/PleaseConnect.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
