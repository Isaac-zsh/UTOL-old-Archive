extends Node

var testing = true
var file = File.new()
 #Camera2D_Limits
var limit_left = -10000000
var limit_right = 10000000
var limit_top = -10000000
var limit_bottom = 10000000
var PlayerCanMove = 0
var Spawn_loc = 0
var Next_Room = 0
var DialogueText = "Test"
var which_character_dialogue = 0
var ReadingDialogue = 0
var FightButtonsMove = true
var items = {
	1 : ["Stick", 2],
	2 : ["Rock", 3],
}
var df = 9999999999
var lv = 9999999999
var gold = 9999999999
var player_character = 9999999999
var player_character1 = 9999999999
var hp = 9999999999
var maxhp = 9999999999
var CharCount = 0
var RuinsMusicPlaying = 0
var cantanimate = 0
var pageselect = 0
var selecting = 0
var CSelect = 0
var player_dir = 0
var inv_vis = 0
var inv_open = 0
var dialogue_open = 0
var skin_loading = 0
var LoginHasBeenCalled = 0
var Username = ""
var GameToken = ""
var touchinganalog = 0
var modulate = 0
var t = 0
var which_pad = 0
var which_pad2 = 0
var controller_connected = 0
var eeee = 0
var what_to_fetch = 0
var account_encryptuon_key = "#M-X8nVhKb28JZse3Ux=sRrJFGcPd$3WRZ!5KC-MjTJxA^Bp8S&HTc^?Ey!nvYezT%v63w=TqXjB=%N#$*bqN%zx^ERnE+vU6wTneL6VwEJmbR#BCeTRcPeVwsbdtv@e"

func _ready():
	if testing == false:
		df = 9999999999
		lv = 9999999999
		gold = 9999999999
		player_character = 9999999999
		player_character1 = 9999999999
		hp = 9999999999
		maxhp = 9999999999
	elif testing == true:
		df = 1
		lv = 1
		gold = 0
		player_character = 0
		player_character1 = 0
		hp = 20
		maxhp = 20
	pass

func damage_player(num):
	if GameMusics.hurt_sfx == 0:
		hp -= num
	GameMusics._play_hurt_sfx()
	pass

func _process(_delta):
	if file.file_exists("user://CV.dat") == false:
		file.open_encrypted_with_pass("user://CV.dat", File.WRITE, account_encryptuon_key)
		file.store_line(str(127.5))
		file.close()
	if file.file_exists("user://Controller.dat") == false:
		file.open_encrypted_with_pass("user://Controller.dat", File.WRITE, account_encryptuon_key)
		file.store_line(str(0))
		file.close()
	elif file.file_exists("user://Controller.dat") == true:
		file.open_encrypted_with_pass("user://Controller.dat", File.READ, account_encryptuon_key)
		t = float(file.get_line())
		which_pad = t
		which_pad2 = t
		file.close()
	if file.file_exists("user://CV.dat") == true:
		file.open_encrypted_with_pass("user://CV.dat", File.READ, "#M-X8nVhKb28JZse3Ux=sRrJFGcPd$3WRZ!5KC-MjTJxA^Bp8S&HTc^?Ey!nvYezT%v63w=TqXjB=%N#$*bqN%zx^ERnE+vU6wTneL6VwEJmbR#BCeTRcPeVwsbdtv@e")
		modulate = float(file.get_line())
		file.close()
		pass

func _do(a):
	if a == 0:
		if file.file_exists("user://Controller.dat") == true:
			file.open_encrypted_with_pass("user://Controller.dat", File.WRITE, "#M-X8nVhKb28JZse3Ux=sRrJFGcPd$3WRZ!5KC-MjTJxA^Bp8S&HTc^?Ey!nvYezT%v63w=TqXjB=%N#$*bqN%zx^ERnE+vU6wTneL6VwEJmbR#BCeTRcPeVwsbdtv@e")
			file.store_line(str(which_pad2))
			file.close()
