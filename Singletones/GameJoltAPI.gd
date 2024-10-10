extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var d = ""
var v = ""
var what_to_do = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$GameJoltAPI.init("d5c7ebd7122298262c1d3e909057d104", 689159)
	pass # Replace with function body.

func auth_user():
	$GameJoltAPI.auth_user(Globals.Username, Globals.GameToken)
	$GameJoltAPI.open_session()

func logout():
	$GameJoltAPI.close_session()
	$GameJoltAPI.auth_user("", "")

func fetch_data_user(a, b):
	$GameJoltAPI.fetch_data(a, b)
	d = a
	v = b

func set_data_user(a, b, c):
	$GameJoltAPI.set_data(a, b, c)

func get_username():
	UserUn.Username = $GameJoltAPI.get_username()

func set_data_key(key, data, ft):
	$GameJoltAPI.set_data(key, data, ft)

func fetch_data_user_skin_1():
	$GameJoltAPI.fetch_data("skin", false)
	what_to_do = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_GameJoltAPI_gamejolt_request_completed(type, message, finished):
	if what_to_do == 3:
		if type=="/sessions/open/": 
			if message["success"]:
				get_username()
				Server.ConnectToServer()
				Globals.LoginHasBeenCalled = 1
			else:
				get_node("/root/AS").failed_popup(0)
				Globals.LoginHasBeenCalled = 2
	if what_to_do == 0:
		if type=="/data-store/":
			if message["success"]:
				if d == "skin":
					Globals.player_character=int(message["data"])
					Globals.skin_loading = 0
				elif d == "hp":
					Globals.hp=int(message["data"])
				elif d == "df":
					Globals.df=int(message["data"])
				elif d == "lv":
					Globals.lv=int(message["data"])
				elif d == "gold":
					Globals.gold=int(message["data"])
			else:
				if d == "skin":
					Globals.player_character=0
					GameJoltApi.set_data_key("skin", 0, false)
					Globals.skin_loading = 0
					Globals.CSelect = 0
				elif d == "hp":
					Globals.hp = 20
					GameJoltApi.set_data_key("hp", 20, false)
				elif d == "df":
					Globals.df = 20
					GameJoltApi.set_data_key("df", 20, false)
				elif d == "lv":
					Globals.lv = 1
					GameJoltApi.set_data_key("lv", 1, false)
				elif d == "gold":
					Globals.gold = 0
					GameJoltApi.set_data_key("gold", 0, false)
	elif what_to_do == 1:
		if type=="/data-store/":
			if message["success"]:
				Globals.player_character1=int(message["data"])
				Globals.eeee = 1
			else:
				Globals.player_character1=0
				Globals.eeee = 1
		pass # Rceplace with function body.
