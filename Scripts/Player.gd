extends KinematicBody2D

var CurrentAnimation = ""
var SPEED = 200
var WhichMovementThingy = 0
var PlayAudioOnce = 0
var player_state
var TextBoxStarted = 0

onready var AnimatedPlayer = get_node("Camera2D/AnimatedSprite")

func _ready():
	set_physics_process(true)
	Globals.cantanimate = 0
	Globals.PlayerCanMove = 0
	if Globals.player_character == 0:
		$CollisionShape2D.shape.extents = Vector2(19, 7)
	elif Globals.player_character == 1:
		$CollisionShape2D.shape.extents = Vector2(19, 7)
	elif Globals.player_character == 4:
		$CollisionShape2D.shape.extents = Vector2(19, 7)
	elif Globals.player_character == 5:
		$CollisionShape2D.shape.extents = Vector2(19, 7)
	elif Globals.player_character == 256:
		$CollisionShape2D.shape.extents = Vector2(30, 6)

func _process(delta):
	if Globals.skin_loading == 1:
		$Camera2D/AnimatedSprite2.play()
		$Camera2D/AnimatedSprite2.show()
		$Camera2D/AnimatedSprite.modulate = Color8(74,74,74,255)
	elif Globals.skin_loading == 0:
		$Camera2D/AnimatedSprite2.stop()
		$Camera2D/AnimatedSprite2.hide()
		$Camera2D/AnimatedSprite.modulate = Color8(255,255,255,255)
		$Camera2D/AnimatedSprite2.set_frame(0)
	if Globals.inv_vis == 0:
		if Globals.player_dir == 1:
			_which_sprite("back")
		if Globals.player_dir == 2:
			_which_sprite("front")
		if Globals.player_dir == 3:
			_which_sprite("right")
		if Globals.player_dir == 4:
			_which_sprite("left")
	pass

func _which_sprite(a):
	if a == "back":
		Globals.player_dir = 1
		if Globals.player_character == 0:
			AnimatedPlayer.play("frisk-back-idle")
		elif Globals.player_character == 1:
			AnimatedPlayer.play("samuel-back-idle")
		elif Globals.player_character == 4:
			AnimatedPlayer.play("chris-back-idle")
		elif Globals.player_character == 5:
			AnimatedPlayer.play("chara-back-idle")
		elif Globals.player_character == 6:
			AnimatedPlayer.play("uffrisk-back-idle")
		elif Globals.player_character == 256:
			AnimatedPlayer.play("rtf-back-idle")
	elif a == "front":
		Globals.player_dir = 2
		if Globals.player_character == 0:
			AnimatedPlayer.play("frisk-front-idle")
		elif Globals.player_character == 1:
			AnimatedPlayer.play("samuel-front-idle")
		elif Globals.player_character == 4:
			AnimatedPlayer.play("chris-front-idle")
		elif Globals.player_character == 5:
			AnimatedPlayer.play("chara-front-idle")
		elif Globals.player_character == 6:
			AnimatedPlayer.play("uffrisk-front-idle")
		elif Globals.player_character == 256:
			AnimatedPlayer.play("rtf-front-idle")
	elif a == "left":
		Globals.player_dir = 4
		if Globals.player_character == 0:
			AnimatedPlayer.play("frisk-left-idle")
		elif Globals.player_character == 1:
			AnimatedPlayer.play("samuel-left-idle")
		elif Globals.player_character == 4:
			AnimatedPlayer.play("chris-left-idle")
		elif Globals.player_character == 5:
			AnimatedPlayer.play("chara-left-idle")
		elif Globals.player_character == 6:
			AnimatedPlayer.play("uffrisk-left-idle")
		elif Globals.player_character == 256:
			AnimatedPlayer.play("rtf-left-idle")
	elif a == "right":
		Globals.player_dir = 3
		if Globals.player_character == 0:
			AnimatedPlayer.play("frisk-right-idle")
		elif Globals.player_character == 1:
			AnimatedPlayer.play("samuel-right-idle")
		elif Globals.player_character == 4:
			AnimatedPlayer.play("chris-right-idle")
		elif Globals.player_character == 5:
			AnimatedPlayer.play("chara-right-idle")
		elif Globals.player_character == 6:
			AnimatedPlayer.play("uffrisk-right-idle")
		elif Globals.player_character == 256:
			AnimatedPlayer.play("rtf-right-idle")

func _physics_process(delta):
	DefinePlayerState()
	if Globals.PlayerCanMove == 0 and Globals.cantanimate == 0:
		get_node("Camera2D/AnimatedSprite").play(CurrentAnimation)
	if Globals.PlayerCanMove == 0 and Globals.skin_loading == 0:
		var velocity  = Vector2()
		if Input.is_action_pressed("ui_down"):
			Globals.player_dir = 2
			Globals.inv_vis = 1
			velocity.y = SPEED
			if Globals.player_character == 0:
				CurrentAnimation = "frisk-front-walk"
			if Globals.player_character == 1:
				CurrentAnimation = "samuel-front-walk"
			if Globals.player_character == 4:
				CurrentAnimation = "chris-front-walk"
			if Globals.player_character == 5:
				CurrentAnimation = "chara-front-walk"
			if Globals.player_character == 6:
				CurrentAnimation = "uffrisk-front-walk"
			if Globals.player_character == 256:
				CurrentAnimation = "rtf-front-walk"
			Globals.cantanimate = 0
		elif Input.is_action_just_released("ui_down"):
			Globals.player_dir = 2
			Globals.inv_vis = 1
			if Globals.player_character == 0:
				CurrentAnimation = "frisk-front-idle"
			if Globals.player_character == 1:
				CurrentAnimation = "samuel-front-idle"
			if Globals.player_character == 4:
				CurrentAnimation = "chris-front-idle"
			if Globals.player_character == 5:
				CurrentAnimation = "chara-front-idle"
			if Globals.player_character == 6:
				CurrentAnimation = "uffrisk-front-idle"
			if Globals.player_character == 256:
				CurrentAnimation = "rtf-front-idle"
			Globals.cantanimate = 0
			SPEED = 200
		elif Input.is_action_pressed("ui_up"):
			Globals.player_dir = 1
			Globals.inv_vis = 1
			velocity.y = -SPEED
			if Globals.player_character == 0:
				CurrentAnimation = "frisk-back-walk"
			if Globals.player_character == 1:
				CurrentAnimation = "samuel-back-walk"
			if Globals.player_character == 4:
				CurrentAnimation = "chris-back-walk"
			if Globals.player_character == 5:
				CurrentAnimation = "chara-back-walk"
			if Globals.player_character == 6:
				CurrentAnimation = "uffrisk-back-walk"
			if Globals.player_character == 256:
				CurrentAnimation = "rtf-back-walk"
			Globals.cantanimate = 0
		elif Input.is_action_just_released("ui_up"):
			Globals.player_dir = 1
			Globals.inv_vis = 1
			velocity.y = -SPEED
			if Globals.player_character == 0:
				CurrentAnimation = "frisk-back-idle"
			if Globals.player_character == 1:
				CurrentAnimation = "samuel-back-idle"
			if Globals.player_character == 4:
				CurrentAnimation = "chris-back-idle"
			if Globals.player_character == 5:
				CurrentAnimation = "chara-back-idle"
			if Globals.player_character == 6:
				CurrentAnimation = "uffrisk-back-idle"
			if Globals.player_character == 256:
				CurrentAnimation = "rtf-back-idle"
			Globals.cantanimate = 0
			SPEED = 200
		else:
			velocity.y = 0
		if Input.is_action_pressed("ui_right"):
			Globals.player_dir = 3
			Globals.inv_vis = 1
			velocity.x = SPEED
			if Globals.player_character == 0:
				CurrentAnimation = "frisk-right-walk"
			if Globals.player_character == 1:
				CurrentAnimation = "samuel-right-walk"
			if Globals.player_character == 4:
				CurrentAnimation = "chris-right-walk"
			if Globals.player_character == 5:
				CurrentAnimation = "chara-right-walk"
			if Globals.player_character == 6:
				CurrentAnimation = "uffrisk-right-walk"
			if Globals.player_character == 256:
				CurrentAnimation = "rtf-right-walk"
			Globals.cantanimate = 0
		elif Input.is_action_just_released("ui_right"):
			Globals.player_dir = 3
			Globals.inv_vis = 1
			velocity.x = SPEED
			if Globals.player_character == 0:
				CurrentAnimation = "frisk-right-idle"
			if Globals.player_character == 1:
				CurrentAnimation = "samuel-right-idle"
			if Globals.player_character == 4:
				CurrentAnimation = "chris-right-idle"
			if Globals.player_character == 5:
				CurrentAnimation = "chara-right-idle"
			if Globals.player_character == 6:
				CurrentAnimation = "uffrisk-right-idle"
			if Globals.player_character == 256:
				CurrentAnimation = "rtf-right-idle"
			Globals.cantanimate = 0
			SPEED = 200
		elif Input.is_action_pressed("ui_left"):
			Globals.player_dir = 4
			Globals.inv_vis = 1
			velocity.x = -SPEED
			if Globals.player_character == 0:
				CurrentAnimation = "frisk-left-walk"
			if Globals.player_character == 1:
				CurrentAnimation = "samuel-left-walk"
			if Globals.player_character == 4:
				CurrentAnimation = "chris-left-walk"
			if Globals.player_character == 5:
				CurrentAnimation = "chara-left-walk"
			if Globals.player_character == 6:
				CurrentAnimation = "uffrisk-left-walk"
			if Globals.player_character == 256:
				CurrentAnimation = "rtf-left-walk"
			Globals.cantanimate = 0
		elif Input.is_action_just_released("ui_left"):
			Globals.player_dir = 4
			Globals.inv_vis = 1
			velocity.x = -SPEED
			if Globals.player_character == 0:
				CurrentAnimation = "frisk-left-idle"
			if Globals.player_character == 1:
				CurrentAnimation = "samuel-left-idle"
			if Globals.player_character == 4:
				CurrentAnimation = "chris-left-idle"
			if Globals.player_character == 5:
				CurrentAnimation = "chara-left-idle"
			if Globals.player_character == 6:
				CurrentAnimation = "uffrisk-left-idle"
			if Globals.player_character == 256:
				CurrentAnimation = "rtf-left-idle"
			Globals.cantanimate = 0
			SPEED = 200
		else:
			velocity.x = 0
		if Input.is_action_pressed("ui_down"):
			Globals.player_dir = 2
			Globals.inv_vis = 1
			velocity.y = SPEED
			if Globals.player_character == 0:
				CurrentAnimation = "frisk-front-walk"
			if Globals.player_character == 1:
				CurrentAnimation = "samuel-front-walk"
			if Globals.player_character == 4:
				CurrentAnimation = "chris-front-walk"
			if Globals.player_character == 5:
				CurrentAnimation = "chara-front-walk"
			if Globals.player_character == 6:
				CurrentAnimation = "uffrisk-front-walk"
			if Globals.player_character == 256:
				CurrentAnimation = "rtf-front-walk"
			Globals.cantanimate = 0
		elif Input.is_action_just_released("ui_down"):
			Globals.player_dir = 2
			Globals.inv_vis = 1
			if Globals.player_character == 0:
				CurrentAnimation = "frisk-front-idle"
			if Globals.player_character == 1:
				CurrentAnimation = "samuel-front-idle"
			if Globals.player_character == 4:
				CurrentAnimation = "chris-front-idle"
			if Globals.player_character == 5:
				CurrentAnimation = "chara-front-idle"
			if Globals.player_character == 6:
				CurrentAnimation = "uffrisk-front-idle"
			if Globals.player_character == 256:
				CurrentAnimation = "rtf-front-idle"
			Globals.cantanimate = 0
			SPEED = 200
		elif Input.is_action_pressed("ui_up"):
			Globals.player_dir = 1
			Globals.inv_vis = 1
			velocity.y = -SPEED
			if Globals.player_character == 0:
				CurrentAnimation = "frisk-back-walk"
			if Globals.player_character == 1:
				CurrentAnimation = "samuel-back-walk"
			if Globals.player_character == 4:
				CurrentAnimation = "chris-back-walk"
			if Globals.player_character == 5:
				CurrentAnimation = "chara-back-walk"
			if Globals.player_character == 6:
				CurrentAnimation = "uffrisk-back-walk"
			if Globals.player_character == 256:
				CurrentAnimation = "rtf-back-walk"
			Globals.cantanimate = 0
		elif Input.is_action_just_released("ui_up"):
			Globals.player_dir = 1
			Globals.inv_vis = 1
			velocity.y = -SPEED
			if Globals.player_character == 0:
				CurrentAnimation = "frisk-back-idle"
			if Globals.player_character == 1:
				CurrentAnimation = "samuel-back-idle"
			if Globals.player_character == 4:
				CurrentAnimation = "chris-back-idle"
			if Globals.player_character == 5:
				CurrentAnimation = "chara-back-idle"
			if Globals.player_character == 6:
				CurrentAnimation = "uffrisk-back-idle"
			if Globals.player_character == 256:
				CurrentAnimation = "rtf-back-idle"
			Globals.cantanimate = 0
			SPEED = 200
		else:
			velocity.y = 0
		if Input.is_action_pressed("ui_right"):
			Globals.player_dir = 3
			Globals.inv_vis = 1
			velocity.x = SPEED
			if Globals.player_character == 0:
				CurrentAnimation = "frisk-right-walk"
			if Globals.player_character == 1:
				CurrentAnimation = "samuel-right-walk"
			if Globals.player_character == 4:
				CurrentAnimation = "chris-right-walk"
			if Globals.player_character == 5:
				CurrentAnimation = "chara-right-walk"
			if Globals.player_character == 6:
				CurrentAnimation = "uffrisk-right-walk"
			if Globals.player_character == 256:
				CurrentAnimation = "rtf-right-walk"
			Globals.cantanimate = 0
		elif Input.is_action_just_released("ui_right"):
			Globals.player_dir = 3
			Globals.inv_vis = 1
			velocity.x = SPEED
			if Globals.player_character == 0:
				CurrentAnimation = "frisk-right-idle"
			if Globals.player_character == 1:
				CurrentAnimation = "samuel-right-idle"
			if Globals.player_character == 4:
				CurrentAnimation = "chris-right-idle"
			if Globals.player_character == 5:
				CurrentAnimation = "chara-right-idle"
			if Globals.player_character == 6:
				CurrentAnimation = "uffrisk-right-idle"
			if Globals.player_character == 256:
				CurrentAnimation = "rtf-right-idle"
			Globals.cantanimate = 0
			SPEED = 200
		elif Input.is_action_pressed("ui_left"):
			Globals.player_dir = 4
			Globals.inv_vis = 1
			velocity.x = -SPEED
			if Globals.player_character == 0:
				CurrentAnimation = "frisk-left-walk"
			if Globals.player_character == 1:
				CurrentAnimation = "samuel-left-walk"
			if Globals.player_character == 4:
				CurrentAnimation = "chris-left-walk"
			if Globals.player_character == 5:
				CurrentAnimation = "chara-left-walk"
			if Globals.player_character == 6:
				CurrentAnimation = "uffrisk-left-walk"
			if Globals.player_character == 256:
				CurrentAnimation = "rtf-left-walk"
			Globals.cantanimate = 0
		elif Input.is_action_just_released("ui_left"):
			Globals.player_dir = 4
			Globals.inv_vis = 1
			velocity.x = -SPEED
			if Globals.player_character == 0:
				CurrentAnimation = "frisk-left-idle"
			if Globals.player_character == 1:
				CurrentAnimation = "samuel-left-idle"
			if Globals.player_character == 4:
				CurrentAnimation = "chris-left-idle"
			if Globals.player_character == 5:
				CurrentAnimation = "chara-left-idle"
			if Globals.player_character == 6:
				CurrentAnimation = "uffrisk-left-idle"
			if Globals.player_character == 256:
				CurrentAnimation = "rtf-left-idle"
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
				if Globals.player_character == 0:
					$Camera2D/AnimatedSprite.play("frisk-back-idle")
				elif Globals.player_character == 1:
					$Camera2D/AnimatedSprite.play("samuel-back-idle")
				elif Globals.player_character == 4:
					$Camera2D/AnimatedSprite.play("chris-back-idle")
				elif Globals.player_character == 5:
					$Camera2D/AnimatedSprite.play("chara-back-idle")
				elif Globals.player_character == 6:
					$Camera2D/AnimatedSprite.play("uffrisk-back-idle")
				elif Globals.player_character == 256:
					$Camera2D/AnimatedSprite.play("rtf-back-idle")
			elif Input.is_action_pressed("ui_down") and !Input.is_action_pressed("ui_left") and !Input.is_action_pressed("ui_right"):
				var collision = get_slide_collision(i)
				$Camera2D/AnimatedSprite.stop()
				$Camera2D/AnimatedSprite.set_frame(1)
				if Globals.player_character == 0:
					$Camera2D/AnimatedSprite.play("frisk-front-idle")
				elif Globals.player_character == 1:
					$Camera2D/AnimatedSprite.play("samuel-front-idle")
				elif Globals.player_character == 4:
					$Camera2D/AnimatedSprite.play("chris-front-idle")
				elif Globals.player_character == 5:
					$Camera2D/AnimatedSprite.play("chara-front-idle")
				elif Globals.player_character == 6:
					$Camera2D/AnimatedSprite.play("uffrisk-front-idle")
				elif Globals.player_character == 256:
					$Camera2D/AnimatedSprite.play("rtf-front-idle")
			elif Input.is_action_pressed("ui_left") and !Input.is_action_pressed("ui_up") and !Input.is_action_pressed("ui_down"):
				var collision = get_slide_collision(i)
				$Camera2D/AnimatedSprite.stop()
				$Camera2D/AnimatedSprite.set_frame(1)
				if Globals.player_character == 0:
					$Camera2D/AnimatedSprite.play("frisk-left-idle")
				elif Globals.player_character == 1:
					$Camera2D/AnimatedSprite.play("samuel-left-idle")
				elif Globals.player_character == 4:
					$Camera2D/AnimatedSprite.play("chris-left-idle")
				elif Globals.player_character == 5:
					$Camera2D/AnimatedSprite.play("chara-left-idle")
				elif Globals.player_character == 6:
					$Camera2D/AnimatedSprite.play("uffrisk-left-idle")
				elif Globals.player_character == 256:
					$Camera2D/AnimatedSprite.play("rtf-left-idle")
			elif Input.is_action_pressed("ui_right") and !Input.is_action_pressed("ui_up") and !Input.is_action_pressed("ui_down"):
				var collision = get_slide_collision(i)
				$Camera2D/AnimatedSprite.stop()
				$Camera2D/AnimatedSprite.set_frame(1)
				if Globals.player_character == 0:
					$Camera2D/AnimatedSprite.play("frisk-right-idle")
				elif Globals.player_character == 1:
					$Camera2D/AnimatedSprite.play("samuel-right-idle")
				elif Globals.player_character == 4:
					$Camera2D/AnimatedSprite.play("chris-right-idle")
				elif Globals.player_character == 5:
					$Camera2D/AnimatedSprite.play("chara-right-idle")
				elif Globals.player_character == 6:
					$Camera2D/AnimatedSprite.play("uffrisk-right-idle")
				elif Globals.player_character == 256:
					$Camera2D/AnimatedSprite.play("rtf-right-idle")

func DefinePlayerState():
	player_state = {"T": OS.get_system_time_msecs(), "P": get_global_position(), "N": $Camera2D/Label.text, "AN": $Camera2D/AnimatedSprite.get_animation(), "AF": $Camera2D/AnimatedSprite.get_frame(), "R": get_tree().get_current_scene().get_name()}
	Server.SendPlayerState(player_state)
