extends Control

onready var chatLog = get_node("VBoxContainer/RichTextLabel")
onready var inputLabel = get_node("HBoxContainer/Label")
onready var inputField = get_node("HBoxContainer/LineEdit")
var group_index = 0
var user_name = 'Player'
var can_send = 0
var visible_char = 0

# Called when the node enters the scene tree for the first time.

func _process(delta):
	#get_node("../../Camera2D/PanelContainer/Label").visible_characters = visible_char
	if can_send == 1:
		inputField.grab_focus()
	if can_send == 0:
		inputField.release_focus()
	$HBoxContainer/Label.text = UserUn.Username + ':'
	if Input.is_action_just_pressed("open_chat"):
		if can_send == 0:
			self.show()
			can_send = 1
			Globals.PlayerCanMove = 1
			Globals.cantanimate = 1
			inputField.text = ''
	if Input.is_action_just_pressed("ui_cancel"):
		if can_send == 1:
			self.hide()
			can_send = 0
			Globals.PlayerCanMove = 0
			Globals.cantanimate = 1
			inputField.text = ''
			pass
			#Do what you gotta do

func _ready():
	self.hide()
	inputField.connect("text_entered", self,'text_entered')

func add_message(username, text, group = 0, color = ''):
	chatLog.text += '\n' 
	chatLog.text += UserUn.Username + ': '
	chatLog.text += text
	visible_char = 0
	get_node("../../Camera2D/PanelContainer").show()
	get_node("../../Camera2D/PanelContainer/Label").text = text

func text_entered(text):
	if text != '':
		add_message(user_name, text, group_index)
		# Here you have to send the message to the server
		inputField.text = ''


func _on_Timer_timeout():
	visible_char = visible_char + 1
	pass # Replace with function body.
