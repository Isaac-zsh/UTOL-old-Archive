extends KinematicBody2D

var CurrentAnimation = ""
var SPEED = 200
var WhichMovementThingy = 0
var PlayAudioOnce = 0
var TextBoxStarted = 0

func _ready():
	Globals.PlayerCanMove = 0

func _physics_process(delta):
	if Globals.PlayerCanMove == 0 and Globals.cantanimate == 0:
		get_node("Camera2D/AnimatedSprite").play(CurrentAnimation)
		var velocity  = Vector2()
		if Input.is_action_pressed("ui_down"):
			velocity.y = SPEED
			CurrentAnimation = "front-walk"
			Globals.cantanimate = 0
		elif Input.is_action_just_released("ui_down"):
			CurrentAnimation = "front-idle"
			Globals.cantanimate = 0
			SPEED = 200
		elif Input.is_action_pressed("ui_up"):
			velocity.y = -SPEED
			CurrentAnimation = "back-walk"
			Globals.cantanimate = 0
		elif Input.is_action_just_released("ui_up"):
			velocity.y = -SPEED
			CurrentAnimation = "back-idle"
			Globals.cantanimate = 0
			SPEED = 200
		else:
			velocity.y = 0
		if Input.is_action_pressed("ui_right"):
			velocity.x = SPEED
			CurrentAnimation = "right-walk"
			Globals.cantanimate = 0
		elif Input.is_action_just_released("ui_right"):
			velocity.x = SPEED
			CurrentAnimation = "right-idle"
			Globals.cantanimate = 0
			SPEED = 200
		elif Input.is_action_pressed("ui_left"):
			velocity.x = -SPEED
			CurrentAnimation = "left-walk"
			Globals.cantanimate = 0
		elif Input.is_action_just_released("ui_left"):
			velocity.x = -SPEED
			CurrentAnimation = "left-idle"
			Globals.cantanimate = 0
			SPEED = 200
		else:
			velocity.x = 0
		if Input.is_action_pressed("ui_down"):
			velocity.y = SPEED
			CurrentAnimation = "front-walk"
			Globals.cantanimate = 0
		elif Input.is_action_just_released("ui_down"):
			CurrentAnimation = "front-idle"
			Globals.cantanimate = 0
			SPEED = 200
		elif Input.is_action_pressed("ui_up"):
			velocity.y = -SPEED
			CurrentAnimation = "back-walk"
			Globals.cantanimate = 0
		elif Input.is_action_just_released("ui_up"):
			velocity.y = -SPEED
			CurrentAnimation = "back-idle"
			Globals.cantanimate = 0
			SPEED = 200
		else:
			velocity.y = 0
		if Input.is_action_pressed("ui_right"):
			velocity.x = SPEED
			CurrentAnimation = "right-walk"
			Globals.cantanimate = 0
		elif Input.is_action_just_released("ui_right"):
			velocity.x = SPEED
			CurrentAnimation = "right-idle"
			Globals.cantanimate = 0
			SPEED = 200
		elif Input.is_action_pressed("ui_left"):
			velocity.x = -SPEED
			CurrentAnimation = "left-walk"
			Globals.cantanimate = 0
		elif Input.is_action_just_released("ui_left"):
			velocity.x = -SPEED
			CurrentAnimation = "left-idle"
			Globals.cantanimate = 0
			SPEED = 200
		else:
			velocity.x = 0
		if Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_left"):
			SPEED = 176.776695
		elif Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_right"):
			SPEED = 176.776695
		elif Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_right"):
			SPEED = 176.776695
		elif Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_left"):
			SPEED = 176.776695
		move_and_slide(velocity)
		if Input.is_action_pressed("ui_running"):
			SPEED = 300
		elif Input.is_action_just_released("ui_running"):
			SPEED = 200
		for i in get_slide_count():
			if Input.is_action_pressed("ui_up") and !Input.is_action_pressed("ui_left") and !Input.is_action_pressed("ui_right"):
				var collision = get_slide_collision(i)
				$Camera2D/AnimatedSprite.stop()
				$Camera2D/AnimatedSprite.set_frame(1)
			if Input.is_action_pressed("ui_down") and !Input.is_action_pressed("ui_left") and !Input.is_action_pressed("ui_right"):
				var collision = get_slide_collision(i)
				$Camera2D/AnimatedSprite.stop()
				$Camera2D/AnimatedSprite.set_frame(1)
			if Input.is_action_pressed("ui_left") and !Input.is_action_pressed("ui_up") and !Input.is_action_pressed("ui_down"):
				var collision = get_slide_collision(i)
				$Camera2D/AnimatedSprite.stop()
				$Camera2D/AnimatedSprite.set_frame(1)
			if Input.is_action_pressed("ui_right") and !Input.is_action_pressed("ui_up") and !Input.is_action_pressed("ui_down"):
				var collision = get_slide_collision(i)
				$Camera2D/AnimatedSprite.stop()
				$Camera2D/AnimatedSprite.set_frame(1)
