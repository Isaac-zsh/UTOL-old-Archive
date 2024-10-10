extends Area2D

var numbg = 0
var LoggedInSound = 0
var FadeRoom = 0
var which_box = 0
onready var GameJolt = load("res://GameJoltAPI.tscn").instance()
# Called when the node enters the scene tree for the first time.
func _ready():
	var NetworkCheck = load("res://NetworkCheck.tscn").instance()
	add_child(NetworkCheck)
	add_child(GameJolt)
	get_tree().connect("network_peer_connected", self, "_player_connected")
	get_tree().connect("connected_to_server", self, "_connected_to_server_ok")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(dt):
	if Globals.LoginHasBeenCalled == 1:
		Globals.LoginHasBeenCalled = 0
		get_node("Label3").set_text("Logged In")
		get_node("LoggedIn").play() 
		GameJoltApi.fetch_data_user("skin", false)
		get_node("LoginButton/AnimationPlayer").play("back") 
		get_node("Button2/AnimationPlayer").play("Back") 
		get_node("GJ_LOGO/AnimationPlayer").play("Back") 
		get_node("Button/AnimationPlayer").play("Back") 
		get_node("CS1/AnimationPlayer").play("Back") 
		get_node("Button3/AnimationPlayer").play("Back") 
		get_node("BackButton/AnimationPlayer").play("Back")
		get_node("Label3/AnimationPlayer").play("1")
	elif Globals.LoginHasBeenCalled == 2:
		get_node("Label3").set_text("Logged Failed")
		Globals.LoginHasBeenCalled = 0
	if numbg == 0:
		get_node("BG-1").set_texture(preload("res://Scenes/LoginMenu/BG-1.png.png"))
		get_node("CS1").set_texture(preload("res://Scenes/LoginMenu/CS1.png"))
		get_node("bg_border_ruins").set_texture(preload("res://1bg_border_ruins.png"))
		get_node("bg_border_ruins").modulate = Color8(0,255,234,255)
	if numbg == 1:
		get_node("BG-1").set_texture(preload("res://Scenes/LoginMenu/bg-2.png"))
		get_node("CS1").set_texture(preload("res://Scenes/LoginMenu/CS.png"))
		get_node("bg_border_ruins").set_texture(preload("res://2bg_border_ruins.png"))
		get_node("bg_border_ruins").modulate = Color8(0255,255,255,255)
	if numbg == 2:
		numbg = 0
	if get_node("Label3").text == "Logged In" and !get_node("ColorRect/AnimationPlayer").is_playing():
		FadeRoom = 1
		get_node("ColorRect/AnimationPlayer").play("UnFade")


func _on_Button_pressed():
	numbg += 1
	pass # Replace with function body.


func _on_Button2_pressed():
	if get_node("Label3").text != "Logging In..." and get_node("Label3").text != "Logged In":
		Globals.Username = $LineEdit.text
		Globals.GameToken = $LineEdit2.text
		GameJoltApi.auth_user()
		get_node("Select").play()
		get_node("Label3").set_text("Logging In...")
	pass # Replace with function body.


func _on_Button2_mouse_entered():
	get_node("LoginButton").set_texture(preload("res://Scenes/LoginMenu/LoginButton1.png"))
	pass # Replace with function body.

func _on_Button2_mouse_exited():
	get_node("LoginButton").set_texture(preload("res://Scenes/LoginMenu/LoginButton.png"))
	pass # Replace with function body.

func _on_AnimationPlayer_animation_finished(UnFade):
	if UnFade == "UnFade" and FadeRoom == 1:
		get_tree().change_scene("res://Room1.tscn")
	if UnFade == "UnFade" and FadeRoom == 2:
		get_tree().change_scene("res://SignUpLogIn.tscn")
		pass # Replace with function body.
	

func _input(event):
	if Input.is_action_just_pressed("ui_down"):
		which_box = which_box + 1
	elif Input.is_action_just_pressed("ui_up"):
		which_box = which_box - 1
func _on_Button3_pressed():
	get_node("ColorRect/AnimationPlayer").play("UnFade")
	FadeRoom = 2
	pass # Replace with function body.
