extends Control

var once = 0
var once2 = 0
var twice = 0
var x_difference = 0
var y_difference = 0
var first_x = 0
var second_x = 0
var first_y = 0
var second_y = 0
var sus = 0
var stop_pos = Vector2(0,0)
var elapsed_1 = 0
var elapsed_2 = 0
var elapsedt = 0
var attack_selected = false
var Knife = load("res://Scenes/tscn/Knife.tscn").instance()
onready var soul = get_node("../../../Player/Soul")
onready var soul1 = get_node("../../../Player")
var soul_pos = Vector2(0,0)
var sussy = 0

func play_attack():
	attack_selected = true
	get_parent().get_parent().get_node("AttackTime").start()
	show()
	pass

func stop_attack():
	attack_selected = false
	hide()
	remove_child(Knife)
	pass

func _process(_dt):
	if attack_selected == false:
		hide()
		elapsed_1 = 0
		elapsed_2 = 0
		#Knife = load("res://Scenes/tscn/Knife.tscn").instance()
		elapsedt = 0
		once = 0
		once2 = 0
		twice = 0
		x_difference = 0
		y_difference = 0
		first_x = 0
		second_x = 0
		first_y = 0
		second_y = 0
		sus = 0
		sussy = 0
		stop_pos = Vector2(0,0)
		$knife_move_down_timer.stop()
	elif attack_selected == true:
		if self.get_parent().get_parent().get_parent().Move == 4:
			if once == 0:
				Knife.name = "Knife"
				Knife.position = get_parent().get_parent().get_node(str(get_parent().name.left(5))).get_position() + Vector2(0,20)
				add_child(Knife)
				Knife.look_at(soul1.get_position())
				$knife_timer.start()
				once = 1
			if sussy == 0:
				Knife.look_at(soul1.get_position())
pass

func _on_knife_timer_timeout():
	if attack_selected == true:
		sussy = 1
		_launch()
	pass # Replace with function body.

func _launch():
	if attack_selected == true:
		soul_pos = soul1.get_position()
		$Tween.interpolate_property(Knife, "position", get_parent().get_parent().get_node(str(get_parent().name.left(5))).get_position(), soul_pos, 0.365, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()
pass

func _launch2():
	if attack_selected == true:
		$Tween.interpolate_property(Knife, "position", stop_pos, add_to_pos(), elapsedt, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()
pass

func add_to_pos():
	if attack_selected == true:
		stop_pos += Vector2(x_difference, y_difference)
		return stop_pos
	pass

func _on_Tween_tween_step(object, key, elapsed, value):
	if attack_selected == true:
		if twice == 0:
			first_x = value[0]
			first_y = value[1]
			elapsed_1 = elapsed
		elif twice == 1:
			second_x = value[0]
			second_y = value[1]
			elapsed_2 = elapsed
		elif twice == 2:
			x_difference = float(str(second_x - first_x).left(4))
			y_difference = float(str(second_y - first_y).left(4))
			elapsedt = elapsed_2 - elapsed_1
		if twice < 3:
			twice += 1
	pass # Replace with function body.


func _on_Tween_tween_all_completed():
	if attack_selected == true:
		$knife_move_down_timer.start()
	pass # Replace with function body.


func _on_knife_move_down_timer_timeout():
	if attack_selected == true:
		if once2 == 0:
			stop_pos = Knife.get_position()
			once2 = 1
		_launch2()
	pass # Replace with function body.
