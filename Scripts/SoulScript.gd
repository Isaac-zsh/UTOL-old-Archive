extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 225
var velocity = Vector2.ZERO

func _ready():
	set_physics_process(true)
	pass # Replace with function body.

func _process(delta):
	$CollisionShape2D.position.x = $Soul.position.x
	$CollisionShape2D.position.y = $Soul.position.y

func _turn_off_pypr(num):
	if num == 0:
		set_physics_process(true)
	elif num == 1:
		set_physics_process(false)
	pass

func _physics_process(delta):
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed
	move_and_slide(velocity)
