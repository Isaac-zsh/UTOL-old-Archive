extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var select = 0
var what_to_show = 0
var delay = 0
var canselect = 0
var once = 0
var file = File.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	DiscordRPC._update_status("Settings", "uton", "Undertale Online")
	$AnimatedSprite.play('1')
	if Globals.which_pad == 0:
		$Control/ControllingType.text = 'Controlling Type: D-PAD'
	elif Globals.which_pad == 1:
		$Control/ControllingType.text = 'Controlling Type: Analog'
	pass # Replace with function body.

func _process(delta):
	if Globals.controller_connected == 0:
		what_to_show = 0
	elif Globals.controller_connected == 1:
		what_to_show = 1
	if what_to_show == 0:
		canselect = 0
		$Control/CV.show()
		$Control/ControllingType.show()
		$Control/EMPTY.hide()
		$Control/reset.show()
		$Control/GoBack.show()
	elif what_to_show == 1:
		$Control/CV.hide()
		$Control/ControllingType.hide()
		$Control/EMPTY.show()
		$Control/reset.hide()
		$Control/GoBack.show()
		canselect = 1
		select = 3
	var Modulate = Globals.modulate/2.55
	$Control/CV.text = 'Controls Visibility: ' + str(int(Modulate))
	if select == 4:
		select = 0
	elif select == -1:
		select = 3
	if canselect == 0 and  Input.is_action_just_pressed("ui_down"):
		select += 1
		$AudioStreamPlayer2D.play()
	elif canselect == 0 and Input.is_action_just_pressed("ui_up"):
		select -= 1
		$AudioStreamPlayer2D.play()
	if select == 0 and Input.is_action_pressed("ui_right") and delay == 0:
		if Modulate < 100:
			Globals.modulate += 2.55
			delay = 1
			file.open_encrypted_with_pass("user://CV.dat", File.WRITE, "#M-X8nVhKb28JZse3Ux=sRrJFGcPd$3WRZ!5KC-MjTJxA^Bp8S&HTc^?Ey!nvYezT%v63w=TqXjB=%N#$*bqN%zx^ERnE+vU6wTneL6VwEJmbR#BCeTRcPeVwsbdtv@e")
			file.store_line(str(Globals.modulate))
			file.close()
			$AudioStreamPlayer2D.play()
			$Timer.start()
		if once == 0:
			once = 1
			$Control/Apply/AnimationPlayer.play("FadeIn")
	elif  select == 0 and Input.is_action_pressed("ui_left") and delay == 0:
		if Modulate > 1:
			Globals.modulate -= 2.55
			delay = 1
			file.open_encrypted_with_pass("user://CV.dat", File.WRITE, "#M-X8nVhKb28JZse3Ux=sRrJFGcPd$3WRZ!5KC-MjTJxA^Bp8S&HTc^?Ey!nvYezT%v63w=TqXjB=%N#$*bqN%zx^ERnE+vU6wTneL6VwEJmbR#BCeTRcPeVwsbdtv@e")
			file.store_line(str(Globals.modulate))
			file.close()
			$AudioStreamPlayer2D.play()
			$Timer.start()
		if once == 0:
			once = 1
			$Control/Apply/AnimationPlayer.play("FadeIn")
	if select == 1 and Input.is_action_just_pressed("ui_right"):
		print(Globals.which_pad2)
		if float(Globals.which_pad2) == 0:
			Globals.which_pad2 = 1
			$Control/ControllingType.text = 'Controlling Type: Analog'
			$AudioStreamPlayer2D.play()
			Globals._do(0)
		elif float(Globals.which_pad2) == 1:
			Globals.which_pad2 = 0
			$Control/ControllingType.text = 'Controlling Type: D-PAD'
			$AudioStreamPlayer2D.play()
			Globals._do(0)
		if once == 0:
			once = 1
			$Control/Apply/AnimationPlayer.play("FadeIn")
	elif select == 1 and Input.is_action_just_pressed("ui_left"):
		if float(Globals.which_pad2) == 0:
			Globals.which_pad2 = 1
			$Control/ControllingType.text = 'Controlling Type: Analog'
			$AudioStreamPlayer2D.play()
			Globals._do(0)
		elif float(Globals.which_pad2) == 1:
			Globals.which_pad2 = 0
			$Control/ControllingType.text = 'Controlling Type: D-PAD'
			$AudioStreamPlayer2D.play()
			Globals._do(0)
		if once == 0:
			once = 1
			$Control/Apply/AnimationPlayer.play("FadeIn")
	elif select == 2 and Input.is_action_just_pressed("PCInteract"):
		file.open_encrypted_with_pass("user://CV.dat", File.WRITE, "#M-X8nVhKb28JZse3Ux=sRrJFGcPd$3WRZ!5KC-MjTJxA^Bp8S&HTc^?Ey!nvYezT%v63w=TqXjB=%N#$*bqN%zx^ERnE+vU6wTneL6VwEJmbR#BCeTRcPeVwsbdtv@e")
		file.store_line(str(127.5))
		file.close()
		Globals.which_pad2 = 0
		Globals._do(0)
		$Control/ControllingType.text = 'Controlling Type: D-PAD'
		$AudioStreamPlayer2D.play()
		if once == 0:
			once = 1
			$Control/Apply/AnimationPlayer.play("FadeIn")
	elif select == 3 and Input.is_action_just_pressed("PCInteract"):
		what_to_show = 10
		$AudioStreamPlayer2D2.play()
		$Control/GoBack.rect_position.x = 9999
		$ColorRect/AnimationPlayer.play("FadeOut")
		canselect = 1
	if select == 0:
		$Control/CV.add_color_override("font_color", Color(255,255,0,1))
		$Control/ControllingType.add_color_override("font_color", Color(255,255,255,1))
		$Control/reset.add_color_override("font_color", Color(255,255,255,1))
		$Control/GoBack.add_color_override("font_color", Color(255,255,255,1))
	elif select == 1:
		$Control/CV.add_color_override("font_color", Color(255,255,255,1))
		$Control/ControllingType.add_color_override("font_color", Color(255,255,0,1))
		$Control/reset.add_color_override("font_color", Color(255,255,255,1))
		$Control/GoBack.add_color_override("font_color", Color(255,255,255,1))
	elif select == 2:
		$Control/CV.add_color_override("font_color", Color(255,255,255,1))
		$Control/ControllingType.add_color_override("font_color", Color(255,255,255,1))
		$Control/reset.add_color_override("font_color", Color(255,255,0,1))
		$Control/GoBack.add_color_override("font_color", Color(255,255,255,1))
	elif select == 3:
		$Control/CV.add_color_override("font_color", Color(255,255,255,1))
		$Control/ControllingType.add_color_override("font_color", Color(255,255,255,1))
		$Control/reset.add_color_override("font_color", Color(255,255,255,1))
		$Control/GoBack.add_color_override("font_color", Color(255,255,0,1))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	delay = 0
	$Timer.stop()
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "FadeOut":
		get_tree().change_scene("res://Scenes/tscn/SelectingMenu.tscn")
	pass # Replace with function body.
