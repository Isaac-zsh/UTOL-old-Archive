extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var SelectMoveSFX = $AudioStreamPlayer2D
onready var SelectSFX = $AudioStreamPlayer2D2
onready var AuthSFX = $AudioStreamPlayer2D3
var SlotSelect = 1
var SlotSelectL2 = 1
var SlotOptionsSelect = 0
var isOptionsSelected = false
var SlotNum = 1
var file = File.new()
var dir = Directory.new()
var Layer = 0
var lock_movement = false
var next_room = 0
var force_hide = false

# Called when the node enters the scene tree for the first time.
func _ready():
	DiscordRPC._update_status("Selecting an account", "uton", "Undertale Online")
	pass # Replace with function body.

func _process(delta):
	if force_hide == true:
		$Control.hide()
		$Control2.hide()
		$Sprite.hide()
		$ColorRect2.hide()
		$ColorRect3.hide()
		$ColorRect4.hide()
		$dots1.hide()
		$dots2.hide()
		$dots3.hide()
		$Label6.hide()
		$dots1/AnimationPlayer.stop(true)
		$dots2/AnimationPlayer.stop(true)
		$dots3/AnimationPlayer.stop(true)

	#visible layer
	if force_hide == false:
		if Layer == 0:
			$Control.show()
			$Control2.hide()
		elif Layer == 1:
			$Control.hide()
			$Control2.show()
	
	#account files
	if SlotNum == 4:
		SlotNum = 1
	if file.file_exists("user://AccSlot" + str(SlotNum) + ".dat") == false:
		get_node("Control/AccountSlot" + str(SlotNum) + "/EMPTY").show()
		get_node("Control/AccountSlot" + str(SlotNum) + "/UsernameSlot1").hide()
		get_node("Control/AccountSlot" + str(SlotNum) + "/PlaySlot1").hide()
		get_node("Control/AccountSlot" + str(SlotNum) + "/DeleteSlot1").hide()
		SlotNum += 1
	if file.file_exists("user://AccSlot" + str(SlotNum) + ".dat") == true:
		get_node("Control/AccountSlot" + str(SlotNum) + "/EMPTY").hide()
		get_node("Control/AccountSlot" + str(SlotNum) + "/UsernameSlot1").show()
		get_node("Control/AccountSlot" + str(SlotNum) + "/PlaySlot1").show()
		get_node("Control/AccountSlot" + str(SlotNum) + "/DeleteSlot1").show()
		file.open_encrypted_with_pass("user://AccSlot" + str(SlotNum) + ".dat", File.READ, Globals.account_encryptuon_key)
		get_node("Control/AccountSlot" + str(SlotNum) + "/UsernameSlot1").text = str(file.get_line())
		file.close()
		SlotNum += 1
	
	#Soul on Slot
	if Layer == 0:
		if isOptionsSelected == false:
			$Control/AccountSlot1/AnimationPlayer.play("NoSelect")
			$Control/AccountSlot2/AnimationPlayer.play("NoSelect")
			$Control/AccountSlot3/AnimationPlayer.play("NoSelect")
			if SlotSelect == 5:
				SlotSelect = 1
			elif SlotSelect == 0:
				SlotSelect = 4
			if SlotSelect == 1:
				$Sprite/AnimationPlayer.play("Slot1")
				$Control/AccountSlot1.play("2")
				$Control/AccountSlot2.play("default")
				$Control/AccountSlot3.play("default")
				$Control/Label/AnimationPlayer.play("white")
			elif SlotSelect == 2:
				$Sprite/AnimationPlayer.play("Slot2")
				$Control/AccountSlot1.play("default")
				$Control/AccountSlot2.play("2")
				$Control/AccountSlot3.play("default")
				$Control/Label/AnimationPlayer.play("white")
			elif SlotSelect == 3:
				$Sprite/AnimationPlayer.play("Slot3")
				$Control/AccountSlot1.play("default")
				$Control/AccountSlot2.play("default")
				$Control/AccountSlot3.play("2")
				$Control/Label/AnimationPlayer.play("white")
			elif SlotSelect == 4:
				$Sprite/AnimationPlayer.play("GoBack1")
				$Control/AccountSlot1.play("default")
				$Control/AccountSlot2.play("default")
				$Control/AccountSlot3.play("default")
				$Control/Label/AnimationPlayer.play("yellow")
			if lock_movement == false:
				if Input.is_action_just_pressed("ui_down"):
					SlotSelect += 1
					SelectMoveSFX.play()
				elif Input.is_action_just_pressed("ui_up"):
					SlotSelect -= 1
					SelectMoveSFX.play()
	if Layer == 1:
		if SlotSelectL2 == 5:
			SlotSelectL2 = 1
		elif SlotSelectL2 == 0:
			SlotSelectL2 = 4
		if lock_movement == false:
			if Input.is_action_just_pressed("ui_down"):
				SlotSelectL2 += 1
				SelectMoveSFX.play()
			elif Input.is_action_just_pressed("ui_up"):
				SlotSelectL2 -= 1
				SelectMoveSFX.play()
		if SlotSelectL2 == 1:
			$Sprite/AnimationPlayer.play("Username1")
			$Control2/Label5/AnimationPlayer.play("white")
		elif SlotSelectL2 == 2:
			$Sprite/AnimationPlayer.play("Token1")
			$Control2/Label5/AnimationPlayer.play("white")
		elif SlotSelectL2 == 3:
			$Sprite/AnimationPlayer.play("Auth1")
			$Control2/Label5/AnimationPlayer.play("white")
		elif SlotSelectL2 == 4:
			$Sprite/AnimationPlayer.play("GoBack2")
			$Control2/Label5/AnimationPlayer.play("yellow")
	
	#Soul on Slot options
	if file.file_exists("user://AccSlot"+str(SlotSelect)+".dat") == false:
		isOptionsSelected = false
	if SlotOptionsSelect == 2:
		SlotOptionsSelect = 0
	elif SlotOptionsSelect == -1:
		SlotOptionsSelect = 1
	if isOptionsSelected == false:
		SlotOptionsSelect = 0
		if Layer == 0:
			if lock_movement == false:
				if Input.is_action_just_pressed("PCInteract"):
					if SlotSelect != 4:
						if file.file_exists("user://AccSlot"+str(SlotSelect)+".dat") == true:
							SelectSFX.play()
							isOptionsSelected = true
						elif file.file_exists("user://AccSlot"+str(SlotSelect)+".dat") == false:
							Layer = 1
							SlotSelectL2 = 1
							SelectSFX.play()
					else:
						SelectSFX.play()
						next_room = 0
						$ColorRect/AnimationPlayer.play("FadeOut")
						lock_movement = true
	elif isOptionsSelected == true:
		if lock_movement == false:
			if Input.is_action_just_pressed("ui_right"):
				SlotOptionsSelect += 1
				SelectMoveSFX.play()
			elif Input.is_action_just_pressed("ui_left"):
				SlotOptionsSelect -= 1
				SelectMoveSFX.play()
			if Input.is_action_just_pressed("ui_running"):
				SelectMoveSFX.play()
				isOptionsSelected = false
		if SlotSelect == 1:
			if SlotOptionsSelect == 0:
				$Sprite/AnimationPlayer.play("Play1")
				$Control/AccountSlot1/AnimationPlayer.play("PlaySelected")
			elif SlotOptionsSelect == 1:
				$Sprite/AnimationPlayer.play("Delete1")
				$Control/AccountSlot1/AnimationPlayer.play("DeleteSelected")
		elif SlotSelect == 2:
			if SlotOptionsSelect == 0:
				$Sprite/AnimationPlayer.play("Play2")
				$Control/AccountSlot2/AnimationPlayer.play("PlaySelected")
			elif SlotOptionsSelect == 1:
				$Sprite/AnimationPlayer.play("Delete2")
				$Control/AccountSlot2/AnimationPlayer.play("DeleteSelected")
		elif SlotSelect == 3:
			if SlotOptionsSelect == 0:
				$Sprite/AnimationPlayer.play("Play3")
				$Control/AccountSlot3/AnimationPlayer.play("PlaySelected")
			elif SlotOptionsSelect == 1:
				$Sprite/AnimationPlayer.play("Delete3")
				$Control/AccountSlot3/AnimationPlayer.play("DeleteSelected")
		if lock_movement == false:
			if Input.is_action_just_pressed("PCInteract"):
				if SlotOptionsSelect == 0:
					file.open_encrypted_with_pass("user://AccSlot" + str(SlotSelect) + ".dat", File.READ, Globals.account_encryptuon_key)
					Globals.Username = str(file.get_line())
					Globals.GameToken = str(file.get_line())
					file.close()
					get_node("ColorRect"+str(SlotSelect+1)).show()
					get_node("dots"+str(SlotSelect)).show()
					get_node("dots"+str(SlotSelect)+"/AnimationPlayer").play("...")
					GameJoltApi.what_to_do = 3
					GameJoltApi.auth_user()
					lock_movement = true
					SelectSFX.play()
				elif SlotOptionsSelect == 1:
					dir.remove("user://AccSlot"+str(SlotSelect)+".dat")
					SelectSFX.play()
	
	#Soul on login options
	if Layer == 1:
		if SlotSelectL2 == 1:
			$Control2/Label4/AnimationPlayer.play("white")
			$Control2/LineEdit.editable = true
			$Control2/LineEdit2.editable = false
			$Control2/LineEdit.grab_focus()
			$Control2/LineEdit2.release_focus()
		if SlotSelectL2 == 2:
			$Control2/Label4/AnimationPlayer.play("white")
			$Control2/LineEdit.editable = false
			$Control2/LineEdit2.editable = true
			$Control2/LineEdit.release_focus()
			$Control2/LineEdit2.grab_focus()
		if SlotSelectL2 == 3:
			$Control2/Label4/AnimationPlayer.play("yellow")
			$Control2/LineEdit.editable = false
			$Control2/LineEdit2.editable = false
			$Control2/LineEdit.release_focus()
			$Control2/LineEdit2.release_focus()
			if lock_movement == false:
				if SlotSelectL2 == 3:
					if Input.is_action_just_pressed("PCInteract"):
						lock_movement = true
						SelectSFX.play()
						$Control2/Label4.hide()
						$Label6.show()
						$Label6/AnimationPlayer.play("authinticating")
						Globals.Username = $Control2/LineEdit.text
						Globals.GameToken = $Control2/LineEdit2.text
						GameJoltApi.what_to_do = 3
						GameJoltApi.auth_user()
		if SlotSelectL2 == 4:
			$Control2/Label4/AnimationPlayer.play("white")
			$Control2/LineEdit.editable = false
			$Control2/LineEdit2.editable = false
			$Control2/LineEdit.release_focus()
			$Control2/LineEdit2.release_focus()
			if lock_movement == false:
				if Input.is_action_just_pressed("PCInteract"):
					SelectSFX.play()
					$Control2/LineEdit.text = ""
					$Control2/LineEdit2.text = ""
					Layer = 0
	
	#login results
	if Globals.LoginHasBeenCalled == 1:
		file.open_encrypted_with_pass("user://AccSlot"+str(SlotSelect)+".dat", File.WRITE, Globals.account_encryptuon_key)
		file.store_line(str(Globals.Username))
		file.store_line(str(Globals.GameToken))
		file.close()
		force_hide = true
		next_room = 1
		AuthSFX.play()
		$ColorRect/AnimationPlayer.play("FadeOut")
		Globals.LoginHasBeenCalled = -3
	elif Globals.LoginHasBeenCalled == 2:
		lock_movement = false
		Globals.LoginHasBeenCalled = -3
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func failed_popup(a):
	if a == 0:
		$Label5.text = "Failed to connect"
	elif a == 1:
		$Label5.text = "User already connected"
	$LightDark/AnimationPlayer.play("ac")
	GameJoltApi.logout()
	isOptionsSelected = false
	lock_movement = false
	$ColorRect2.hide()
	$ColorRect3.hide()
	$ColorRect4.hide()
	$dots1.hide()
	$dots2.hide()
	$dots3.hide()
	$dots1/AnimationPlayer.stop(true)
	$dots2/AnimationPlayer.stop(true)
	$dots3/AnimationPlayer.stop(true)

func auth():
	Globals.LoginHasBeenCalled = 1

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "FadeOut":
		if next_room == 0:
			get_tree().change_scene("res://Scenes/tscn/MainMenu.tscn")
		elif next_room == 1:
			get_tree().change_scene("res://Scenes/tscn/SelectingMenu.tscn")
	pass # Replace with function body.
