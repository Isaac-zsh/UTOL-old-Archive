extends Node2D

var Selected = 0
var WhichSelect = 0
var WhichSelect2 = 0
var WhichSelect3 = 0
var slot1exists = 0
var slot2exists = 0
var slot3exists = 0
var which_room_next = 0
var auth = 0
var fading = 0
var yes = 0
var yes2 = 0
var force_hide =  0
var e = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var file = File.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play('1')
	$Label6.hide()
	if file.file_exists("user://AccSlot1.dat") == false:
		$Control/AccountSlot1/UsernameSlot1.hide()
		$Control/AccountSlot1/PlaySlot1.hide()
		$Control/AccountSlot1/DeleteSlot1.hide()
		$Control/AccountSlot1/EMPTY.show()
		slot1exists = 0
	if file.file_exists("user://AccSlot2.dat") == false:
		$Control/AccountSlot2/UsernameSlot1.hide()
		$Control/AccountSlot2/PlaySlot1.hide()
		$Control/AccountSlot2/DeleteSlot1.hide()
		$Control/AccountSlot2/EMPTY2.show()
		slot2exists = 0
	if file.file_exists("user://AccSlot3.dat") == false:
		$Control/AccountSlot3/UsernameSlot1.hide()
		$Control/AccountSlot3/PlaySlot1.hide()
		$Control/AccountSlot3/DeleteSlot1.hide()
		$Control/AccountSlot3/EMPTY3.show()
		slot3exists = 0
	if file.file_exists("user://AccSlot1.dat") == true:
		$Control/AccountSlot1/UsernameSlot1.show()
		$Control/AccountSlot1/PlaySlot1.show()
		$Control/AccountSlot1/DeleteSlot1.show()
		$Control/AccountSlot1/EMPTY.hide()
		var file = File.new()
		file.open_encrypted_with_pass("user://AccSlot1.dat", File.READ, "#M-X8nVhKb28JZse3Ux=sRrJFGcPd$3WRZ!5KC-MjTJxA^Bp8S&HTc^?Ey!nvYezT%v63w=TqXjB=%N#$*bqN%zx^ERnE+vU6wTneL6VwEJmbR#BCeTRcPeVwsbdtv@e")
		$Control/AccountSlot1/UsernameSlot1.text = str(file.get_line())
		file.close()
		slot1exists = 1
	if file.file_exists("user://AccSlot2.dat") == true:
		$Control/AccountSlot2/UsernameSlot1.show()
		$Control/AccountSlot2/PlaySlot1.show()
		$Control/AccountSlot2/DeleteSlot1.show()
		$Control/AccountSlot2/EMPTY2.hide()
		slot2exists = 1
		file.open_encrypted_with_pass("user://AccSlot2.dat", File.READ, "#M-X8nVhKb28JZse3Ux=sRrJFGcPd$3WRZ!5KC-MjTJxA^Bp8S&HTc^?Ey!nvYezT%v63w=TqXjB=%N#$*bqN%zx^ERnE+vU6wTneL6VwEJmbR#BCeTRcPeVwsbdtv@e")
		$Control/AccountSlot2/UsernameSlot1.text = str(file.get_line())
		file.close()
		slot2exists = 1
	if file.file_exists("user://AccSlot3.dat") == true:
		$Control/AccountSlot3/UsernameSlot1.show()
		$Control/AccountSlot3/PlaySlot1.show()
		$Control/AccountSlot3/DeleteSlot1.show()
		$Control/AccountSlot3/EMPTY3.hide()
		slot3exists = 1
		file.open_encrypted_with_pass("user://AccSlot3.dat", File.READ, "#M-X8nVhKb28JZse3Ux=sRrJFGcPd$3WRZ!5KC-MjTJxA^Bp8S&HTc^?Ey!nvYezT%v63w=TqXjB=%N#$*bqN%zx^ERnE+vU6wTneL6VwEJmbR#BCeTRcPeVwsbdtv@e")
		$Control/AccountSlot3/UsernameSlot1.text = str(file.get_line())
		file.close()
		slot3exists = 1
	pass # Replace with function body.

func save_slot_1():
	var file = File.new()
	file.open_encrypted_with_pass("user://AccSlot1.dat", File.WRITE, "#M-X8nVhKb28JZse3Ux=sRrJFGcPd$3WRZ!5KC-MjTJxA^Bp8S&HTc^?Ey!nvYezT%v63w=TqXjB=%N#$*bqN%zx^ERnE+vU6wTneL6VwEJmbR#BCeTRcPeVwsbdtv@e")
	file.store_line(str(Globals.Username))
	file.store_line(str(Globals.GameToken))
	file.close()
func save_slot_2():
	var file = File.new()
	file.open_encrypted_with_pass("user://AccSlot2.dat", File.WRITE, "#M-X8nVhKb28JZse3Ux=sRrJFGcPd$3WRZ!5KC-MjTJxA^Bp8S&HTc^?Ey!nvYezT%v63w=TqXjB=%N#$*bqN%zx^ERnE+vU6wTneL6VwEJmbR#BCeTRcPeVwsbdtv@e")
	file.store_line(str(Globals.Username))
	file.store_line(str(Globals.GameToken))
	file.close()
func save_slot_3():
	var file = File.new()
	file.open_encrypted_with_pass("user://AccSlot3.dat", File.WRITE, "#M-X8nVhKb28JZse3Ux=sRrJFGcPd$3WRZ!5KC-MjTJxA^Bp8S&HTc^?Ey!nvYezT%v63w=TqXjB=%N#$*bqN%zx^ERnE+vU6wTneL6VwEJmbR#BCeTRcPeVwsbdtv@e")
	file.store_line(str(Globals.Username))
	file.store_line(str(Globals.GameToken))
	file.close()

func _process(delta):
	if e == 1:
		if Globals.eeee == 1:
			if Globals.player_character1 != 9999999999:
				get_tree().change_scene("res://Scenes/tscn/SelectingMenu.tscn")
	if force_hide == 1:
		$Label.hide()
		$Label2.hide()
		$Label3.hide()
		$Control.hide()
		$Label6.hide()
		$Control2.hide()
		$Sprite.hide()
		$ColorRect2.hide()
		$ColorRect3.hide()
		$ColorRect4.hide()
	if yes2 == 1 and yes > 1:
		Selected = 2
		$Control2/Label4.show()
		$Label6.hide()
		yes2 = 0
	if auth == 1:
		$Label6/AnimationPlayer.stop()
	if Globals.LoginHasBeenCalled == 1:
		get_node("Label6").set_text("Authenticated")
		fading = 1
		which_room_next = 0
		$Control2.hide()
		if WhichSelect == 0:
			save_slot_1()
		elif WhichSelect == 1:
			save_slot_2()
		elif WhichSelect == 2:
			save_slot_3()
		force_hide = 1
		$ColorRect/AnimationPlayer.play("FadeOut")
		$AudioStreamPlayer2D3.play()
		auth = 1
		Globals.LoginHasBeenCalled = 0
	elif Globals.LoginHasBeenCalled == 2:
		get_node("Label6").set_text("Authentication Failed")
		yes = 0
		yes2 = 1
		fading = 0
		Globals.LoginHasBeenCalled = 0
		auth = 1
		$Control2/LineEdit.text = ""
		$Control2/LineEdit2.text = ""
		WhichSelect3 = 0
	if Input.is_action_just_pressed("ui_down"):
		if Selected == 0:
			WhichSelect = WhichSelect + 1
			$AudioStreamPlayer2D.play()
		elif Selected == 2:
			WhichSelect3 = WhichSelect3 + 1
			$AudioStreamPlayer2D.play()
	elif Input.is_action_just_pressed("ui_up"):
		if Selected == 0:
			WhichSelect = WhichSelect - 1
			$AudioStreamPlayer2D.play()
		elif Selected == 2:
			WhichSelect3 = WhichSelect3 - 1
			$AudioStreamPlayer2D.play()
	if Input.is_action_just_pressed("ui_right"):
		if Selected == 1:
			WhichSelect2 = WhichSelect2 + 1
			$AudioStreamPlayer2D.play()
	elif Input.is_action_just_pressed("ui_left"):
		if Selected == 1:
			WhichSelect2 = WhichSelect2 - 1
			$AudioStreamPlayer2D.play()
	if WhichSelect == 4:
		WhichSelect = 0
	elif WhichSelect == -1:
		WhichSelect = 3
	if WhichSelect2 == -1:
		WhichSelect2 = 1
	elif WhichSelect2 == 2:
		WhichSelect2 = 0
	if WhichSelect3 == -1:
		WhichSelect3 = 3
	elif WhichSelect3 == 4:
		WhichSelect3 = 0
	if WhichSelect == 0:
		if Selected == 0:
			$Control/AccountSlot1.play('2')
			$Control/AccountSlot2.play('default')
			$Control/AccountSlot3.play('default')
			$Control/Label.add_color_override("font_color", Color(255,255,255,1))
			$Sprite/AnimationPlayer.play("Slot1")
	elif WhichSelect == 1:
		if Selected == 0:
			$Control/AccountSlot1.play('default')
			$Control/AccountSlot2.play('2')
			$Control/AccountSlot3.play('default')
			$Control/Label.add_color_override("font_color", Color(255,255,255,1))
			$Sprite/AnimationPlayer.play("Slot2")
	elif WhichSelect == 2:
		if Selected == 0:
			$Control/AccountSlot1.play('default')
			$Control/AccountSlot2.play('default')
			$Control/AccountSlot3.play('2')
			$Control/Label.add_color_override("font_color", Color(255,255,255,1))
			$Sprite/AnimationPlayer.play("Slot3")
	elif WhichSelect == 3:
		if Selected == 0:
			$Control/AccountSlot1.play('default')
			$Control/AccountSlot2.play('default')
			$Control/AccountSlot3.play('default')
			$Control/Label.add_color_override("font_color", Color(255,255,0,1))
			$Sprite/AnimationPlayer.play("GoBack1")
	if WhichSelect == 0:
		if WhichSelect2 == 0:
			if Selected == 1:
				$Control/AccountSlot1/PlaySlot1.add_color_override("font_color", Color(255,255,0,1))
				$Control/AccountSlot1/DeleteSlot1.add_color_override("font_color", Color(255,255,255,1))
				$Sprite/AnimationPlayer.play("Play1")
		elif WhichSelect2 == 1:
			if Selected == 1:
				$Control/AccountSlot1/PlaySlot1.add_color_override("font_color", Color(255,255,255,1))
				$Control/AccountSlot1/DeleteSlot1.add_color_override("font_color", Color(255,255,0,1))
				$Sprite/AnimationPlayer.play("Delete1")
	elif WhichSelect == 1:
		if WhichSelect2 == 0:
			if Selected == 1:
				$Sprite/AnimationPlayer.play("Play2")
				$Control/AccountSlot2/PlaySlot1.add_color_override("font_color", Color(255,255,0,1))
				$Control/AccountSlot2/DeleteSlot1.add_color_override("font_color", Color(255,255,255,1))
		elif WhichSelect2 == 1:
			if Selected == 1:
				$Sprite/AnimationPlayer.play("Delete2")
				$Control/AccountSlot2/PlaySlot1.add_color_override("font_color", Color(255,255,255,1))
				$Control/AccountSlot2/DeleteSlot1.add_color_override("font_color", Color(255,255,0,1))
	elif WhichSelect == 2:
		if WhichSelect2 == 0:
			if Selected == 1:
				$Sprite/AnimationPlayer.play("Play3")
				$Control/AccountSlot3/PlaySlot1.add_color_override("font_color", Color(255,255,0,1))
				$Control/AccountSlot3/DeleteSlot1.add_color_override("font_color", Color(255,255,255,1))
		elif WhichSelect2 == 1:
			if Selected == 1:
				$Sprite/AnimationPlayer.play("Delete3")
				$Control/AccountSlot3/PlaySlot1.add_color_override("font_color", Color(255,255,255,1))
				$Control/AccountSlot3/DeleteSlot1.add_color_override("font_color", Color(255,255,0,1))
	if WhichSelect3 == 0:
		if Selected == 2:
			$Sprite/AnimationPlayer.play("Username1")
			$Control2/Label3.add_color_override("font_color", Color(255,255,0,1))
			$Control2/Label2.add_color_override("font_color", Color(255,255,255,1))
			$Control2/Label4.add_color_override("font_color", Color(255,255,255,1))
			$Control2/Label5.add_color_override("font_color", Color(255,255,255,1))
			$Control2/LineEdit.grab_focus()
			$Control2/LineEdit2.release_focus()
			$Control2/LineEdit.set_editable(true)
			$Control2/LineEdit2.set_editable(false)
	elif WhichSelect3 == 1:
		if Selected == 2:
			$Sprite/AnimationPlayer.play("Token1")
			$Control2/Label3.add_color_override("font_color", Color(255,255,255,1))
			$Control2/Label2.add_color_override("font_color", Color(255,255,0,1))
			$Control2/Label4.add_color_override("font_color", Color(255,255,255,1))
			$Control2/Label5.add_color_override("font_color", Color(255,255,255,1))
			$Control2/LineEdit.release_focus()
			$Control2/LineEdit2.grab_focus()
			$Control2/LineEdit.set_editable(false)
			$Control2/LineEdit2.set_editable(true)
	elif WhichSelect3 == 2:
		if Selected == 2:
			$Sprite/AnimationPlayer.play("Auth1")
			$Control2/Label3.add_color_override("font_color", Color(255,255,255,1))
			$Control2/Label2.add_color_override("font_color", Color(255,255,255,1))
			$Control2/Label4.add_color_override("font_color", Color(255,255,0,1))
			$Control2/Label5.add_color_override("font_color", Color(255,255,255,1))
			$Control2/LineEdit.release_focus()
			$Control2/LineEdit2.release_focus()
			$Control2/LineEdit.set_editable(false)
			$Control2/LineEdit2.set_editable(false)
	elif WhichSelect3 == 3:
		if Selected == 2:
			$Sprite/AnimationPlayer.play("GoBack2")
			$Control2/Label3.add_color_override("font_color", Color(255,255,255,1))
			$Control2/Label2.add_color_override("font_color", Color(255,255,255,1))
			$Control2/Label4.add_color_override("font_color", Color(255,255,255,1))
			$Control2/Label5.add_color_override("font_color", Color(255,255,0,1))
			$Control2/LineEdit.release_focus()
			$Control2/LineEdit2.release_focus()
			$Control2/LineEdit.set_editable(false)
			$Control2/LineEdit2.set_editable(false)
	if Input.is_action_just_pressed("PCInteract"):
		if Selected == 0:
			if WhichSelect == 0 and slot1exists == 1:
				$Control/AccountSlot1.play('default')
				$AudioStreamPlayer2D2.play()
				Selected = 1
			elif WhichSelect == 1 and slot2exists == 1:
				$Control/AccountSlot2.play('default')
				$AudioStreamPlayer2D2.play()
				Selected = 1
			elif WhichSelect == 2 and slot3exists == 1:
				$Control/AccountSlot3.play('default')
				$AudioStreamPlayer2D2.play()
				Selected = 1
			if WhichSelect == 0 and slot1exists == 0:
				$AudioStreamPlayer2D2.play()
				Selected = 2
				_selected_2(0)
				$Control2/Label4.show()
			elif WhichSelect == 1 and slot2exists == 0:
				$AudioStreamPlayer2D2.play()
				Selected = 2
				_selected_2(0)
				$Control2/Label4.show()
			elif WhichSelect == 2 and slot3exists == 0:
				$AudioStreamPlayer2D2.play()
				Selected = 2
				_selected_2(0)
				$Control2/Label4.show()
			elif WhichSelect == 3:
				$AudioStreamPlayer2D2.play()
				WhichSelect = 5
				force_hide = 1
				$ColorRect/AnimationPlayer.play("FadeOut")
				which_room_next = 1
		elif Selected == 1:
			if WhichSelect2 == 0:
				if WhichSelect == 0:
					var file = File.new()
					file.open_encrypted_with_pass("user://AccSlot1.dat", File.READ, "#M-X8nVhKb28JZse3Ux=sRrJFGcPd$3WRZ!5KC-MjTJxA^Bp8S&HTc^?Ey!nvYezT%v63w=TqXjB=%N#$*bqN%zx^ERnE+vU6wTneL6VwEJmbR#BCeTRcPeVwsbdtv@e")
					Globals.Username = str(file.get_line())
					Globals.GameToken = str(file.get_line())
					file.close()
					Server.ConnectToServer()
					$AudioStreamPlayer2D2.play()
					$ColorRect2.show()
					$Label.show()
					WhichSelect = 5
					$Label/AnimationPlayer.play("...")
					slot1exists = 0
				elif WhichSelect == 1:
					var file = File.new()
					file.open_encrypted_with_pass("user://AccSlot2.dat", File.READ, "#M-X8nVhKb28JZse3Ux=sRrJFGcPd$3WRZ!5KC-MjTJxA^Bp8S&HTc^?Ey!nvYezT%v63w=TqXjB=%N#$*bqN%zx^ERnE+vU6wTneL6VwEJmbR#BCeTRcPeVwsbdtv@e")
					Globals.Username = str(file.get_line())
					Globals.GameToken = str(file.get_line())
					file.close()
					Server.ConnectToServer()
					$AudioStreamPlayer2D2.play()
					$ColorRect3.show()
					$Label2.show()
					WhichSelect2 = 5
					$Label2/AnimationPlayer2.play("...")
					slot2exists = 0
				elif WhichSelect == 2:
					var file = File.new()
					file.open_encrypted_with_pass("user://AccSlot3.dat", File.READ, "#M-X8nVhKb28JZse3Ux=sRrJFGcPd$3WRZ!5KC-MjTJxA^Bp8S&HTc^?Ey!nvYezT%v63w=TqXjB=%N#$*bqN%zx^ERnE+vU6wTneL6VwEJmbR#BCeTRcPeVwsbdtv@e")
					Globals.Username = str(file.get_line())
					Globals.GameToken = str(file.get_line())
					file.close()
					Server.ConnectToServer()
					$AudioStreamPlayer2D2.play()
					$ColorRect4.show()
					$Label3.show()
					WhichSelect3 = 5
					$Label3/AnimationPlayer3.play("...")
					slot3exists = 0
			elif WhichSelect2 == 1:
				if WhichSelect == 0:
					var file = File.new()
					var dir = Directory.new()
					dir.remove("user://AccSlot1.dat")
					$AudioStreamPlayer2D2.play()
					file.close()
					$Control/AccountSlot1/UsernameSlot1.hide()
					$Control/AccountSlot1/PlaySlot1.hide()
					$Control/AccountSlot1/DeleteSlot1.hide()
					$Control/AccountSlot1/EMPTY.show()
					slot1exists = 0
					Selected = 0
				elif WhichSelect == 1:
					var file = File.new()
					var dir = Directory.new()
					dir.remove("user://AccSlot2.dat")
					$AudioStreamPlayer2D2.play()
					file.close()
					$Control/AccountSlot2/UsernameSlot1.hide()
					$Control/AccountSlot2/PlaySlot1.hide()
					$Control/AccountSlot2/DeleteSlot1.hide()
					$Control/AccountSlot2/EMPTY2.show()
					slot2exists = 0
					Selected = 0
				elif WhichSelect == 2:
					var file = File.new()
					var dir = Directory.new()
					dir.remove("user://AccSlot3.dat")
					$AudioStreamPlayer2D2.play()
					file.close()
					$Control/AccountSlot3/UsernameSlot1.hide()
					$Control/AccountSlot3/PlaySlot1.hide()
					$Control/AccountSlot3/DeleteSlot1.hide()
					$Control/AccountSlot3/EMPTY3.show()
					slot3exists = 0
					Selected = 0
		elif Selected == 2:
			if WhichSelect3 == 2:
				$Control2/Label4.hide()
				$Label6.show()
				$AudioStreamPlayer2D2.play()
				if $Label6.text != "Authenticating" or $Label6.text != "Authenticating." or $Label6.text != "Authenticating.." or $Label6.text != "Authenticating..." or $Label6.text != "Authenticated" and auth == 0:
					$Label6/AnimationPlayer.play("appearing")
					Globals.Username = $Control2/LineEdit.text
					Globals.GameToken = $Control2/LineEdit2.text
					Server.ConnectToServer()
					Selected = 4
					auth = 0
			if WhichSelect3 == 3:
				Selected = 0
				$Control2/LineEdit.text = ""
				$Control2/LineEdit2.text = ""
				WhichSelect2 = 0
				_selected_2(1)
				$AudioStreamPlayer2D.play()
				yes2 = 0
				WhichSelect3 = 0
	if Input.is_action_just_pressed("ui_running"):
		if Selected == 1:
			Selected = 0
			WhichSelect2 = 0
			if WhichSelect == 0:
				$Control/AccountSlot1.play('2')
				$Control/AccountSlot1/PlaySlot1.add_color_override("font_color", Color(255,255,255,1))
				$Control/AccountSlot1/DeleteSlot1.add_color_override("font_color", Color(255,255,255,1))
				Selected = 0
				$AudioStreamPlayer2D.play()
			elif WhichSelect == 1:
				$Control/AccountSlot2.play('2')
				$Control/AccountSlot2/PlaySlot1.add_color_override("font_color", Color(255,255,255,1))
				$Control/AccountSlot2/DeleteSlot1.add_color_override("font_color", Color(255,255,255,1))
				Selected = 0
				$AudioStreamPlayer2D.play()
			elif WhichSelect == 2:
				$Control/AccountSlot3.play('2')
				$Control/AccountSlot3/PlaySlot1.add_color_override("font_color", Color(255,255,255,1))
				$Control/AccountSlot3/DeleteSlot1.add_color_override("font_color", Color(255,255,255,1))
				Selected = 0
				$AudioStreamPlayer2D.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func failed_popup():
	$LightDark/AnimationPlayer.play("hide")

func UAC():
	$LightDark/AnimationPlayer.play("ac")
	$Label.hide()
	$Label2.hide()
	$Label3.hide()
	WhichSelect = 0
	$ColorRect2.hide()
	$ColorRect3.hide()
	$ColorRect4.hide()

func auth():
	GameJoltApi.auth_user()
	GameJoltApi.fetch_data_user_skin_1()

func _selected_2(a):
	if a == 0:
		$Control2.show()
		$Control.hide()
	elif a == 1:
		$Control2.hide()
		$Control.show()
		$Label6.hide()

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "FadeOut" and which_room_next == 0:
		e = 1
	elif anim_name == "FadeOut" and which_room_next == 1:
		get_tree().change_scene("res://Scenes/tscn/MainMenu.tscn")
	pass # Replace with function body.

func _on_Timer_timeout():
	yes = yes + 1
	pass # Replace with function body.
