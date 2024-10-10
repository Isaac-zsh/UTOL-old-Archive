extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.rect_position.y = get_node("../AnimatedSprite").position.y - 40
	self.set_text(UserUn.Username)
	pass # Replace with function body.

func _process(_delta):
	if Globals.player_character == 0:
		self.rect_position.y = get_node("../AnimatedSprite").position.y - 40
	if Globals.player_character == 1:
		self.rect_position.y = get_node("../AnimatedSprite").position.y - 40
	if Globals.player_character == 2:
		self.rect_position.y = get_node("../AnimatedSprite").position.y - 40
	if Globals.player_character == 256:
		self.rect_position.y = get_node("../AnimatedSprite").position.y - 30


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
