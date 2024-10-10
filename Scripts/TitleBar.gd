extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var following = false
var dragging_start_session = Vector2()
var animation_done = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	if following:
		OS.set_window_position(OS.window_position + get_global_mouse_position() - dragging_start_session)
	if Fs.Fullscreen == 0 and OS.get_name() == "Windows":
		self.show()
		get_node("../ExitButton").show()
		get_node("../MinimizeButton").show()
		OS.set_borderless_window(true)
	elif Fs.Fullscreen == 1 and OS.get_name() == "Windows":
		self.hide()
		get_node("../ExitButton").hide()
		get_node("../MinimizeButton").hide()
		OS.set_borderless_window(true)
	if OS.get_name() == "Android" or OS.get_name() == "iOS":
		self.show()
		get_node("../ExitButton").hide()
		get_node("../MinimizeButton").hide()
	if OS.get_name() == "X11" or OS.get_name() == "OSX":
		self.hide()
		get_node("../ExitButton").hide()
		get_node("../MinimizeButton").hide()
		if Fs.Fullscreen == 0:
			OS.set_borderless_window(false)
			pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TitleBar_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1:
			following = !following
			dragging_start_session = get_local_mouse_position()
	pass # Replace with function body.

func _process(_delta):
	if following:
		OS.set_window_position(OS.window_position + get_global_mouse_position() - dragging_start_session)
	if Fs.Fullscreen == 0 and OS.get_name() == "Windows":
		self.show()
		get_node("../ExitButton").show()
		get_node("../MinimizeButton").show()
		OS.set_borderless_window(true)
	elif Fs.Fullscreen == 1 and OS.get_name() == "Windows":
		self.hide()
		get_node("../ExitButton").hide()
		get_node("../MinimizeButton").hide()
		OS.set_borderless_window(true)
	if OS.get_name() == "Android" or OS.get_name() == "iOS":
		self.hide()
		get_node("../ExitButton").hide()
		get_node("../MinimizeButton").hide()
	if OS.get_name() == "X11" or OS.get_name() == "OSX":
		self.hide()
		get_node("../ExitButton").hide()
		get_node("../MinimizeButton").hide()
		if Fs.Fullscreen == 0:
			OS.set_borderless_window(false)


func _on_ExitButton_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_MinimizeButton_pressed():
	OS.set_window_minimized(true)
	pass # Replace with function body.
