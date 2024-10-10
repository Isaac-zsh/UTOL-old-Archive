 extends CanvasLayer
 
var modulate = Globals.modulate
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var file = File.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	if OS.get_name() == "Windows" or OS.get_name() == "X11" or OS.get_name() == "OSX" or OS.get_name() == "UWP" or OS.get_name() == "HTML5" or OS.get_name() == "Switch":
		Globals.controller_connected = 1
	elif OS.get_name() == "Android" or OS.get_name() == "iOS":
		Globals.controller_connected = 0
	modulate = Globals.modulate
	$DownButton.modulate = Color8(255,255,255,modulate)
	$UpButton.modulate = Color8(255,255,255,modulate)
	$LeftButton.modulate = Color8(255,255,255,modulate)
	$RightButton.modulate = Color8(255,255,255,modulate)
	$ZButton.modulate = Color8(255,255,255,modulate)
	$XButton.modulate = Color8(255,255,255,modulate)
	$CButton.modulate = Color8(255,255,255,modulate)
	$Node2D/Sprite.modulate = Color8(255,255,255,modulate)
	_controls_stuff()
	Input.connect("joy_connection_changed", self, "_on_joy_connection_changed")
	pass # Replace with function body.

func _input(event):
	if(event is InputEventScreenTouch):
		Globals.controller_connected = 0
		_controls_stuff()
	elif(event is InputEventJoypadButton):
		Globals.controller_connected = 1
		_controls_stuff()
	elif(event is InputEventJoypadMotion):
		Globals.controller_connected = 1
		_controls_stuff()
	elif(event is InputEventKey):
		Globals.controller_connected = 1
		_controls_stuff()
		pass

func _process(_delta):
	modulate = Globals.modulate
	$DownButton.modulate = Color8(255,255,255,modulate)
	$UpButton.modulate = Color8(255,255,255,modulate)
	$LeftButton.modulate = Color8(255,255,255,modulate)
	$RightButton.modulate = Color8(255,255,255,modulate)
	$ZButton.modulate = Color8(255,255,255,modulate)
	$XButton.modulate = Color8(255,255,255,modulate)
	$CButton.modulate = Color8(255,255,255,modulate)
	$Node2D/Sprite.modulate = Color8(255,255,255,modulate)
	$Node2D/Sprite.modulate = Color8(255,255,255,modulate)
	$Node2D/Sprite.modulate = Color8(255,255,255,modulate)
	pass

func _controls_stuff():
	if Globals.controller_connected == 0:
		if Globals.which_pad == 0:
			get_node("DownButton").show()
			get_node("UpButton").show()
			get_node("LeftButton").show()
			get_node("RightButton").show()
			$Node2D/Sprite.hide()
			$Node2D/TouchScreenButton.hide()
			$Node2D/TouchScreenButton2.hide()
			$Node2D/TouchScreenButton3.hide()
			$Node2D/TouchScreenButton4.hide()
			get_node("ZButton").show()
			get_node("XButton").show()
			get_node("CButton").show()
		elif Globals.which_pad == 1:
			get_node("DownButton").hide()
			get_node("UpButton").hide()
			get_node("LeftButton").hide()
			get_node("RightButton").hide()
			$Node2D/Sprite.show()
			$Node2D/TouchScreenButton.show()
			$Node2D/TouchScreenButton2.show()
			$Node2D/TouchScreenButton3.show()
			$Node2D/TouchScreenButton4.show()
			get_node("ZButton").show()
			get_node("XButton").show()
			get_node("CButton").show()
	elif Globals.controller_connected == 1:
		get_node("DownButton").hide()
		get_node("UpButton").hide()
		get_node("LeftButton").hide()
		get_node("RightButton").hide()
		get_node("ZButton").hide()
		get_node("XButton").hide()
		get_node("CButton").hide()
		$Node2D/Sprite.hide()
		$Node2D/TouchScreenButton.hide()
		$Node2D/TouchScreenButton2.hide()
		$Node2D/TouchScreenButton3.hide()
		$Node2D/TouchScreenButton4.hide()
		get_node("ZButton").hide()
		get_node("XButton").hide()
		get_node("CButton").hide()
		pass

func _on_DownButton_pressed():
	Input.action_press("ui_down")
	pass # Replace with function body.


func _on_DownButton_released():
	Input.action_release("ui_down")
	pass # Replace with function body.


func _on_LeftButton_pressed():
	Input.action_press("ui_left")
	pass # Replace with function body.                               

func _on_LeftButton_released():
	Input.action_release("ui_left")
	pass # Replace with function body.

func _on_RightButton_pressed():
	Input.action_press("ui_right")
	pass # Replace with function body.


func _on_RightButton_released():
	Input.action_release("ui_right")
	pass # Replace with function body.


func _on_UpButton_pressed():
	Input.action_press("ui_up")
	pass # Replace with function body.

func _on_UpButton_released():
	Input.action_release("ui_up")
	pass # Replace with function body.


func _on_ZButton_pressed():
	Input.action_press("PCInteract")
	pass # Replace with function body.


func _on_ZButton_released():
	Input.action_release("PCInteract")
	pass # Replace with function body..


func _on_XButton_pressed():
	Input.action_press("ui_running")
	pass # Replace with function body.


func _on_XButton_released():
	Input.action_release("ui_running")
	pass # Replace with function body.


func _on_CButton_pressed():
	Input.action_press("Inventory")
	pass # Replace with function body.


func _on_CButton_released():
	Input.action_release("Inventory")
	pass # Replace with function body.

func _on_TouchScreenButton_pressed():
	Input.action_press("ui_up")
	pass # Replace with function body.


func _on_TouchScreenButton_released():
	Input.action_release("ui_up")
	pass # Replace with function body.


func _on_TouchScreenButton2_pressed():
	Input.action_press("ui_down")
	pass # Replace with function body.


func _on_TouchScreenButton2_released():
	Input.action_release("ui_down")
	pass # Replace with function body.


func _on_TouchScreenButton3_pressed():
	Input.action_press("ui_left")
	pass # Replace with function body.


func _on_TouchScreenButton3_released():
	Input.action_release("ui_left")
	pass # Replace with function body.


func _on_TouchScreenButton4_pressed():
	Input.action_press("ui_right")
	pass # Replace with function body.


func _on_TouchScreenButton4_released():
	Input.action_release("ui_right")
	pass # Replace with function body.
