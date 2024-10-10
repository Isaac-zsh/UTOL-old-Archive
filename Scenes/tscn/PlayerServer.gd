extends KinematicBody2D

func MovePlayer(new_position, scene):
	if scene == "Room1":
		set_position(new_position - Vector2(840, 260))
	elif scene == "Room2" or scene == "Room3":
		set_position(new_position - Vector2(684, 325))
	pass

func SetName(username):
	$Label.text = username

func SetAnim(Name, Frame):
	$AnimatedSprite.set_animation(Name)
	$AnimatedSprite.set_frame(Frame)
