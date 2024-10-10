extends Control

var x_difference = 0
var y_difference = 0
var first_x = 0
var second_x = 0
var first_y = 0
var once = 0
var second_y = 0
var bullet_num = 0
var bullet_d_num = 0
var attack_selected = false
var Bullet = load("res://Scenes/tscn/bullet1.tscn").instance()
var soul_pos = Vector2(0,0)
var bullets = []
var number = 0
onready var soul = get_node("../../../Player/Soul")
onready var soul1 = get_node("../../../Player")

func play_attack():
	attack_selected = true
	get_parent().get_parent().get_node("AttackTime").start()
	show()
	pass

func stop_attack():
	attack_selected = false
	hide()
	bullet_num = 0
	pass

func _process(delta):
	if bullets.size() -1 >= 0:
		bullets[number].look_at(soul1.get_position())
	if attack_selected == false:
		Bullet.queue_free()
		bullets = []
		Bullet = load("res://Scenes/tscn/bullet1.tscn").instance()
		number = 0
	if once == 0:
		$spawn_time.start()
		once = 1
	pass

func _on_spawn_time_timeout():
	if attack_selected == true:
		if self.get_parent().get_parent().get_parent().Move == 4:
			Bullet = load("res://Scenes/tscn/bullet1.tscn").instance()
			Bullet.name = "Bullet"+str(bullet_num)
			Bullet.position = get_parent().get_parent().get_node(get_parent().name.left(5)).get_position() + Vector2(0,20)
			add_child(Bullet)
			bullets.append(get_node("Bullet"+str(bullet_num)))
			bullet_num += 1
		#_launch()
	pass # Replace with function body.

func _launch():
	if attack_selected == true:
		if self.get_parent().get_parent().get_parent().Move == 4:
			if bullets.size()-1 >= 0:
				$Tween.interpolate_property(bullets[number], "position", bullets[number].get_position(), soul1.get_position() - Vector2(), 0.225, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
				$Tween.start()
pass

func _on_removebullets_timeout():
	_launch()
	if attack_selected == false:
		if has_node("Bullet"+str(bullet_d_num)):
			remove_child(get_node("Bullet"+str(bullet_d_num)))
		bullet_d_num += 1
	elif attack_selected == true:
		bullet_d_num = 0
	pass # Replace with function body.

func _on_bullet_timer_timeout():
	if number < bullets.size() -1:
		number += 1
	elif number >= bullets.size() -1:
		number = 0
	pass # Replace with function body.
