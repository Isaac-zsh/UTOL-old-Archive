extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(_delta):
	if Globals.PlayerCanMove == 1:
		self.stop()
		self.set_frame(1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
