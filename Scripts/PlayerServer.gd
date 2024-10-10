extends KinematicBody2D

func MovePlayer(new_position):
	set_position(new_position - Vector2(840, 260))
	pass

func SetName(username):
	$Label.text = username

func SetAnim(Name, Frame):
	$AnimatedSprite.set_animation(Name)
	$AnimatedSprite.set_frame(Frame)
