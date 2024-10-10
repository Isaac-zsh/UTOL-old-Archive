extends Node2D

var fade_is_not_loaded = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var choice = 0
var login = 0
onready var GameJolt = load("res://GameJoltAPI.tscn").instance()
var select = 0
var which_room_next = 0
var auth = 0
var fading = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	var NetworkCheck = load("res://NetworkCheck.tscn").instance()
	add_child(NetworkCheck)
	add_child(GameJolt)
	var TouchControls = load("res://TouchControls.tscn").instance()
	add_child(TouchControls)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _process(_delta):
	if auth == 1:
		$Label5/AnimationPlayer.stop()
	if Globals.LoginHasBeenCalled == 1:
		Globals.LoginHasBeenCalled = 0
		get_node("Label5").set_text("Authenticated")
		fading = 1
		which_room_next = 0
		$Control/LogIn.hide()
		$Control/SignUp.hide()
		$Control/GoBack.hide()
		$Control2.hide()
		$Label5.hide()
		$Label6.hide()
		$ColorRect/AnimationPlayer.play("FadeOut")
		$Control/AudioStreamPlayer2D3.play()
		GameJoltApi.fetch_data_user("skin", false)
		auth = 1
	elif Globals.LoginHasBeenCalled == 2:
		get_node("Label5").set_text("Authentication Failed")
		fading = 0
		Globals.LoginHasBeenCalled = 0
		auth = 1
	if choice == 4:
		choice = 0 
	if choice == -1:
		choice = 1
	if choice == 0 and login == 1:
		$Control2/LineEdit.set_editable(true)
		$Control2/LineEdit2.set_editable(false)
		$Control2/Label3.add_color_override("font_color", Color(255,255,0,1))
		$Control2/Label2.add_color_override("font_color", Color(255,255,255,1))
		$Control2/Label4.add_color_override("font_color", Color(255,255,255,1))
		$Label6.add_color_override("font_color", Color(255,255,255,1))
	elif choice == 1 and login == 1:
		$Control2/LineEdit.set_editable(false)
		$Control2/LineEdit2.set_editable(true)
		$Control2/Label3.add_color_override("font_color", Color(255,255,255,1))
		$Control2/Label2.add_color_override("font_color", Color(255,255,0,1))
		$Control2/Label4.add_color_override("font_color", Color(255,255,255,1))
		$Label6.add_color_override("font_color", Color(255,255,255,1))
	elif choice == 2 and login == 1:
		$Control2/LineEdit.set_editable(false)
		$Control2/LineEdit2.set_editable(false)
		$Control2/Label3.add_color_override("font_color", Color(255,255,255,1))
		$Control2/Label2.add_color_override("font_color", Color(255,255,255,1))
		$Control2/Label4.add_color_override("font_color", Color(255,255,0,1))
		$Label6.add_color_override("font_color", Color(255,255,255,1))
	elif choice == 3 and login == 1:
		$Control2/LineEdit.set_editable(false)
		$Control2/LineEdit2.set_editable(false)
		$Control2/Label3.add_color_override("font_color", Color(255,255,255,1))
		$Control2/Label2.add_color_override("font_color", Color(255,255,255,1))
		$Control2/Label4.add_color_override("font_color", Color(255,255,255,1))
		$Label6.add_color_override("font_color", Color(255,255,0,1))
	if select == -1:
		select = 2
	elif select == 3:
		select = 0
	if Input.is_action_just_pressed("ui_down") and fading == 0:
		if login == 0:
			select = select + 1
		if login == 1:
			choice = choice + 1
		$Control/AudioStreamPlayer2D.play()
	elif Input.is_action_just_pressed("ui_up") and fading == 0:
		if login == 0:
			select = select - 1
		if login == 1:
			choice = choice - 1
		$Control/AudioStreamPlayer2D.play()
	if Input.is_action_just_pressed("PCInteract") and fading == 0:
		if select == 0 and login == 0:
			get_node("ColorRect/AnimationPlayer").play("FadeOut")
			$Control/AudioStreamPlayer2D2.play()
			which_room_next = 0
			#login = 1
			#choice = 0
			$Control/LogIn.hide()
			$Control/SignUp.hide()
			$Control/GoBack.hide()
			$Control2.hide()
			$Label5.hide()
			$Label6.hide()
		if select == 1 and login == 0:
			$Control/AudioStreamPlayer2D2.play()
			OS.shell_open("https://gamejolt.com/join")
		if select == 2 and login == 0:
			$Control/AudioStreamPlayer2D2.play()
			which_room_next = 1
			get_node("ColorRect/AnimationPlayer").play("FadeOut")
			$Control/LogIn.hide()
			$Control/SignUp.hide()
			$Control/GoBack.hide()
			fading = 1
		if choice == 2 and login == 1:
			$Control2/Label4.hide()
			$Label5.show()
			$Control/AudioStreamPlayer2D2.play()
			$Label5/AnimationPlayer.play("appearing")
			if $Label5.text != "Authenticating" or $Label5.text != "Authenticating." or $Label5.text != "Authenticating.." or $Label5.text != "Authenticating..." and get_node("Label5").text != "Authenticated" and auth == 0:
				Globals.Username = $Control2/LineEdit.text
				Globals.GameToken = $Control2/LineEdit2.text
				GameJoltApi.auth_user()
				fading = 1
				auth = 0
		if choice == 3 and login == 1:
			$Control2.hide()
			$Control/LogIn.show()
			$Control/SignUp.show()
			$Control/GoBack.show()
			$Control/AudioStreamPlayer2D.play()
			$Label5.hide()
			$Label6.hide()
			login = 0

	if select == 0 and login == 0:
		$Control/LogIn.add_color_override("font_color", Color(255,255,0,1))
		$Control/SignUp.add_color_override("font_color", Color(255,255,255,1))
		$Control/GoBack.add_color_override("font_color", Color(255,255,255,1))
	elif select == 1 and login == 0:
		$Control/LogIn.add_color_override("font_color", Color(255,255,255,1))
		$Control/SignUp.add_color_override("font_color", Color(255,255,0,1))
		$Control/GoBack.add_color_override("font_color", Color(255,255,255,1))
	elif select == 2 and login == 0:
		$Control/LogIn.add_color_override("font_color", Color(255,255,255,1))
		$Control/SignUp.add_color_override("font_color", Color(255,255,255,1))
		$Control/GoBack.add_color_override("font_color", Color(255,255,0,1))

func _on_LogIn_pressed():
	if fade_is_not_loaded == 0:
		$Control/AudioStreamPlayer2D2.play()
	pass # Replace with function body.


func _on_SignUp_pressed():
	if fade_is_not_loaded == 0:
		$Control/AudioStreamPlayer2D2.play()
		OS.shell_open("https://gamejolt.com/join")
	pass # Replace with function body.

func _on_AnimationPlayer_animation_finished(FadeOut):
	if FadeOut == "FadeOut" and which_room_next == 0:
		get_tree().change_scene("res://AccountSelector.tscn")
	if FadeOut == "FadeOut" and which_room_next == 1:
		get_tree().change_scene("res://MainMenu.tscn")
	if FadeOut == "appearing":
		$Label5/AnimationPlayer.play("authinticating")
		pass # Replace with function body.
