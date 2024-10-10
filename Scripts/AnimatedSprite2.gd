extends AnimatedSprite

var inv_vis = 0
var select_item = 1
var select_item2 = 1
var select_item3 = 1

onready var GameJolt = load("res://Singletones/GameJoltAPI.tscn").instance()

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(GameJolt)
	GameJoltApi.fetch_data_user("skin", false)
	if inv_vis == 0:
		self.hide()
		inv_vis = 1
		Globals.PlayerCanMove = 0
	elif inv_vis == 1:
		self.show()
		inv_vis = 0
		Globals.inv_vis = 0
		Globals.PlayerCanMove = 1
	UpdateInv()
	$Label.text = UserUn.Username
	pass # Replace with function body.

func _process(_delta):
	if select_item <= Globals.items.size():
		if select_item3 > 3:
			select_item3 = 1
		if select_item < 4:
			select_item2 = 1
		elif select_item < 7:
			select_item2 = 2
		elif select_item < 10:
			select_item2 = 3
		#get_node("PlayersInventory1/ITEM1").text = str(Globals.items.values()[0][0])
		get_node("PlayersInventory"+str(select_item2)+"/ITEM"+str(select_item3)).text = Globals.items.values()[select_item-1][0]
		#get_node("PlayersInventory"+str(select_item2)+"/ITEM"+str(select_item3)).text = Globals.items[select_item][0]
		select_item += 1
		select_item3 += 1
	else:
		select_item = 1
		select_item2 = 1
		select_item3 = 1
		pass
	$Label2.text = "LV: " + str(Globals.lv)
	$Label3.text = "HP: " + str(Globals.hp)
	$Label4.text = "G: " + str(Globals.gold)
	if Globals.player_character == 0:
		$AnimatedSprite.play("Frisk")
	elif Globals.player_character == 1:
		$AnimatedSprite.play("Samuel")
	elif Globals.player_character == 4:
		$AnimatedSprite.play("Chris")
	elif Globals.player_character == 5:
		$AnimatedSprite.play("Chara")
	elif Globals.player_character == 256:
		$AnimatedSprite.play("RobTopFreak")
	if inv_vis == 0:
		if Globals.pageselect == 0:
			if Globals.CSelect == 4:
				Globals.CSelect = 0
				UpdateInv()
				$AudioStreamPlayer2D.play()
			if Globals.CSelect == -1:
				Globals.CSelect = 3
				UpdateInv()
				$AudioStreamPlayer2D.play()
		elif Globals.pageselect == 1:
			if Globals.selecting == 0:
				if Globals.CSelect == 3:
					Globals.CSelect = 0
					Globals.selecting = 1
					UpdateInv()
					$AudioStreamPlayer2D.play()
			if Globals.selecting == 0:
				if Globals.CSelect == -1:
					Globals.CSelect = 1
					Globals.selecting = 2
					UpdateInv()
					$AudioStreamPlayer2D.play()
			if Globals.selecting == 1:
				if Globals.CSelect == -1:
					Globals.CSelect = 2
					Globals.selecting = 0
					UpdateInv()
					$AudioStreamPlayer2D.play()
			if Globals.selecting == 1:
				if Globals.CSelect == 3:
					Globals.CSelect = 0
					Globals.selecting = 2
					UpdateInv()
					$AudioStreamPlayer2D.play()
			if Globals.selecting == 2:
				if Globals.CSelect == 2:
					Globals.CSelect = 0
					Globals.selecting = 0
					UpdateInv()
					$AudioStreamPlayer2D.play()
			if Globals.selecting == 2:
				if Globals.CSelect == -1:
					Globals.CSelect = 2
					Globals.selecting = 1
					UpdateInv()
					$AudioStreamPlayer2D.play()
		elif Globals.pageselect == 4:
			if Globals.CSelect == 3:
				Globals.CSelect = 0
				UpdateInv()
				$AudioStreamPlayer2D.play()
			if Globals.CSelect == -1:
				Globals.CSelect = 2
				UpdateInv()
				$AudioStreamPlayer2D.play()
		elif Globals.pageselect == 5:
			if Globals.CSelect == 3:
				Globals.CSelect = 0
				UpdateInv()
				$AudioStreamPlayer2D.play()
			if Globals.CSelect == -1:
				Globals.CSelect = 2
				UpdateInv()
				$AudioStreamPlayer2D.play()
	if Input.is_action_just_pressed("Inventory") and Globals.dialogue_open == 0:
		if inv_vis == 0 and Globals.skin_loading == 0:
			self.hide()
			inv_vis = 1
			Globals.inv_open = 0
			Globals.pageselect = 0
			Globals.selecting = 0
			Globals.CSelect = 0
			$PlayersMenu/ITEM/Label5.add_color_override("font_color", Color(255,255,0,1))
			$PlayersMenu/STAT/Label5.add_color_override("font_color", Color(255,255,255,1))
			$PlayersMenu/CELL/Label5.add_color_override("font_color", Color(255,255,255,1))
			$PlayersMenu/SKIN/Label5.add_color_override("font_color", Color(255,255,255,1))
			$PlayersMenu/ITEM/AnimatedSprite.play("Selected")
			$PlayersMenu/STAT/AnimatedSprite.play("NotSelected")
			$PlayersMenu/CELL/AnimatedSprite.play("NotSelected")
			$PlayersMenu/SKIN/AnimatedSprite.play("NotSelected")
			UpdateInv()
			Globals.PlayerCanMove = 0
			get_node("../Stats").show()
		elif inv_vis == 1 and Globals.skin_loading == 0:
			self.show()
			Globals.PlayerCanMove = 1
			inv_vis = 0
			Globals.inv_vis = 0
			Globals.selecting = 0
			Globals.inv_open = 1
			Globals.pageselect = 0
			Globals.selecting = 0
			Globals.CSelect = 0
			$PlayersMenu/ITEM/Label5.add_color_override("font_color", Color(255,255,0,1))
			$PlayersMenu/STAT/Label5.add_color_override("font_color", Color(255,255,255,1))
			$PlayersMenu/CELL/Label5.add_color_override("font_color", Color(255,255,255,1))
			$PlayersMenu/SKIN/Label5.add_color_override("font_color", Color(255,255,255,1))
			$PlayersMenu/ITEM/AnimatedSprite.play("Selected")
			$PlayersMenu/STAT/AnimatedSprite.play("NotSelected")
			$PlayersMenu/CELL/AnimatedSprite.play("NotSelected")
			$PlayersMenu/SKIN/AnimatedSprite.play("NotSelected")
			$AudioStreamPlayer2D.play()
			get_node("../Stats").hide()
	if Input.is_action_just_pressed("ui_right") and inv_vis == 0:
		if Globals.pageselect == 0:
			Globals.CSelect = Globals.CSelect + 1
			UpdateInv()
			$AudioStreamPlayer2D.play()
		if Globals.pageselect == 1:
			Globals.CSelect = Globals.CSelect + 1
			UpdateInv()
			$AudioStreamPlayer2D.play()
		if Globals.pageselect == 4:
			Globals.CSelect = Globals.CSelect + 1
			UpdateInv()
			$AudioStreamPlayer2D.play()
		if Globals.pageselect == 5:
			Globals.CSelect = Globals.CSelect + 1
			UpdateInv()
			$AudioStreamPlayer2D.play()
	if Input.is_action_just_pressed("ui_left") and inv_vis == 0:
		if Globals.pageselect == 0:
			Globals.CSelect = Globals.CSelect - 1
			UpdateInv()
			$AudioStreamPlayer2D.play()
		if Globals.pageselect == 1:
			Globals.CSelect = Globals.CSelect - 1
			UpdateInv()
			$AudioStreamPlayer2D.play()
		if Globals.pageselect == 4:
			Globals.CSelect = Globals.CSelect - 1
			UpdateInv()
			$AudioStreamPlayer2D.play()
		if Globals.pageselect == 5:
			Globals.CSelect = Globals.CSelect - 1
			UpdateInv()
			$AudioStreamPlayer2D.play()
	if Input.is_action_just_pressed("PCInteract") and inv_vis == 0:
		if Globals.pageselect == 0:
			if Globals.CSelect == 0:
				Globals.pageselect = 1
				Globals.selecting = 0
				$AudioStreamPlayer2D2.play()
				Globals.CSelect = 0
				UpdateInv()
			elif Globals.CSelect == 1:
				Globals.pageselect = 2
				$AudioStreamPlayer2D2.play()
				UpdateInv()
			elif Globals.CSelect == 3:
				Globals.pageselect = 4
				$AudioStreamPlayer2D2.play()
				Globals.CSelect = 0
				UpdateInv()
		elif Globals.pageselect == 4:
			if Globals.CSelect == 0:
				Globals.pageselect = 5
				$AudioStreamPlayer2D2.play()
				Globals.CSelect = 0
				UpdateInv()
		elif Globals.pageselect == 5:
			if Globals.CSelect == 0:
				$AudioStreamPlayer2D2.play()
				GameJoltApi.set_data_user("skin", 0, false)
				Globals.skin_loading = 1
				GameJoltApi.fetch_data_user("skin", false)
				_hide_inv()
			if Globals.CSelect == 1:
				$AudioStreamPlayer2D2.play()
				GameJoltApi.set_data_user("skin", 5, false)
				Globals.skin_loading = 1
				GameJoltApi.fetch_data_user("skin", false)
				_hide_inv()
			if Globals.CSelect == 2:
				$AudioStreamPlayer2D2.play()
				GameJoltApi.set_data_user("skin", 4, false)
				Globals.skin_loading = 1
				GameJoltApi.fetch_data_user("skin", false)
				_hide_inv()
	if Input.is_action_just_pressed("ui_running") and inv_vis == 0:
		if Globals.pageselect == 2:
			Globals.pageselect = 0
			$AudioStreamPlayer2D.play()
			UpdateInv()
		elif Globals.pageselect == 1:
			Globals.pageselect = 0
			Globals.selecting = 0
			Globals.CSelect = 0
			$AudioStreamPlayer2D.play()
			UpdateInv()
		elif Globals.pageselect == 5:
			Globals.pageselect = 4
			Globals.CSelect = 0
			$AudioStreamPlayer2D.play()
			UpdateInv()
		elif Globals.pageselect == 4:
			Globals.pageselect = 0
			Globals.CSelect = 3
			$AudioStreamPlayer2D.play()
			UpdateInv()

func UpdateInv():
	if Globals.CSelect == 0 and Globals.pageselect == 0:
		$PlayersMenu/ITEM/Label5.add_color_override("font_color", Color(255,255,0,1))
		$PlayersMenu/STAT/Label5.add_color_override("font_color", Color(255,255,255,1))
		$PlayersMenu/CELL/Label5.add_color_override("font_color", Color(255,255,255,1))
		$PlayersMenu/SKIN/Label5.add_color_override("font_color", Color(255,255,255,1))
		$PlayersMenu/ITEM/AnimatedSprite.play("Selected")
		$PlayersMenu/STAT/AnimatedSprite.play("NotSelected")
		$PlayersMenu/CELL/AnimatedSprite.play("NotSelected")
		$PlayersMenu/SKIN/AnimatedSprite.play("NotSelected")
		$PlayersMenu.show()
		$PlayersSTAT.hide() 
		$PlayersUTSKINS.hide()
		$PlayersSKIN.hide()  
		$PlayersInventory1.hide()
		$PlayersInventory2.hide()
		$PlayersInventory3.hide()
	if Globals.CSelect == 1 and Globals.pageselect == 0:
		$PlayersMenu/ITEM/Label5.add_color_override("font_color", Color(255,255,255,1))
		$PlayersMenu/STAT/Label5.add_color_override("font_color", Color(255,255,0,1))
		$PlayersMenu/CELL/Label5.add_color_override("font_color", Color(255,255,255,1))
		$PlayersMenu/SKIN/Label5.add_color_override("font_color", Color(255,255,255,1))
		$PlayersMenu/ITEM/AnimatedSprite.play("NotSelected")
		$PlayersMenu/STAT/AnimatedSprite.play("Selected")
		$PlayersMenu/CELL/AnimatedSprite.play("NotSelected")
		$PlayersMenu/SKIN/AnimatedSprite.play("NotSelected")
		$PlayersMenu.show()
		$PlayersSTAT.hide()
		$PlayersUTSKINS.hide()
		$PlayersSKIN.hide()
		$PlayersInventory1.hide()
		$PlayersInventory2.hide()
		$PlayersInventory3.hide()
	if Globals.CSelect == 2 and Globals.pageselect == 0:
		$PlayersMenu/ITEM/Label5.add_color_override("font_color", Color(255,255,255,1))
		$PlayersMenu/STAT/Label5.add_color_override("font_color", Color(255,255,255,1))
		$PlayersMenu/CELL/Label5.add_color_override("font_color", Color(255,255,0,1))
		$PlayersMenu/SKIN/Label5.add_color_override("font_color", Color(255,255,255,1))
		$PlayersMenu/ITEM/AnimatedSprite.play("NotSelected")
		$PlayersMenu/STAT/AnimatedSprite.play("NotSelected")
		$PlayersMenu/CELL/AnimatedSprite.play("Selected")
		$PlayersMenu/SKIN/AnimatedSprite.play("NotSelected")
		$PlayersMenu.show()
		$PlayersSTAT.hide()
		$PlayersUTSKINS.hide()
		$PlayersSKIN.hide()
		$PlayersInventory1.hide()
		$PlayersInventory2.hide()
		$PlayersInventory3.hide()
	if Globals.CSelect == 3 and Globals.pageselect == 0:
		$PlayersMenu/ITEM/Label5.add_color_override("font_color", Color(255,255,255,1))
		$PlayersMenu/STAT/Label5.add_color_override("font_color", Color(255,255,255,1))
		$PlayersMenu/CELL/Label5.add_color_override("font_color", Color(255,255,255,1))
		$PlayersMenu/SKIN/Label5.add_color_override("font_color", Color(255,255,0,1))
		$PlayersMenu/ITEM/AnimatedSprite.play("NotSelected")
		$PlayersMenu/STAT/AnimatedSprite.play("NotSelected")
		$PlayersMenu/CELL/AnimatedSprite.play("NotSelected")
		$PlayersMenu/SKIN/AnimatedSprite.play("Selected")
		$PlayersMenu.show()
		$PlayersSTAT.hide()
		$PlayersUTSKINS.hide()
		$PlayersSKIN.hide()
		$PlayersInventory1.hide()
		$PlayersInventory2.hide()
		$PlayersInventory3.hide()
	if Globals.pageselect == 1:
		if Globals.selecting == 0:
			$PlayersMenu.hide()
			$PlayersSTAT.hide()
			$PlayersUTSKINS.hide()
			$PlayersSKIN.hide()
			$PlayersInventory1.show()
			$PlayersInventory2.hide()
			$PlayersInventory3.hide()
			if Globals.CSelect == 0:
				$PlayersInventory1/ITEM1.add_color_override("font_color", Color(255,255,0,1))
				$PlayersInventory1/ITEM2.add_color_override("font_color", Color(255,255,255,1))
				$PlayersInventory1/ITEM3.add_color_override("font_color", Color(255,255,255,1))
			if Globals.CSelect == 1:
				$PlayersInventory1/ITEM1.add_color_override("font_color", Color(255,255,255,1))
				$PlayersInventory1/ITEM2.add_color_override("font_color", Color(255,255,0,1))
				$PlayersInventory1/ITEM3.add_color_override("font_color", Color(255,255,255,1))
			if Globals.CSelect == 2:
				$PlayersInventory1/ITEM1.add_color_override("font_color", Color(255,255,255,1))
				$PlayersInventory1/ITEM2.add_color_override("font_color", Color(255,255,255,1))
				$PlayersInventory1/ITEM3.add_color_override("font_color", Color(255,255,0,1))
		elif Globals.selecting == 1:
			$PlayersMenu.hide()
			$PlayersSTAT.hide()
			$PlayersUTSKINS.hide()
			$PlayersSKIN.hide()
			$PlayersInventory1.hide()
			$PlayersInventory2.show()
			$PlayersInventory3.hide()
			if Globals.CSelect == 0:
				$PlayersInventory2/ITEM1.add_color_override("font_color", Color(255,255,0,1))
				$PlayersInventory2/ITEM2.add_color_override("font_color", Color(255,255,255,1))
				$PlayersInventory2/ITEM3.add_color_override("font_color", Color(255,255,255,1))
			if Globals.CSelect == 1:
				$PlayersInventory2/ITEM1.add_color_override("font_color", Color(255,255,255,1))
				$PlayersInventory2/ITEM2.add_color_override("font_color", Color(255,255,0,1))
				$PlayersInventory2/ITEM3.add_color_override("font_color", Color(255,255,255,1))
			if Globals.CSelect == 2:
				$PlayersInventory2/ITEM1.add_color_override("font_color", Color(255,255,255,1))
				$PlayersInventory2/ITEM2.add_color_override("font_color", Color(255,255,255,1))
				$PlayersInventory2/ITEM3.add_color_override("font_color", Color(255,255,0,1))
		elif Globals.selecting == 2:
			$PlayersMenu.hide()
			$PlayersSTAT.hide()
			$PlayersUTSKINS.hide()
			$PlayersSKIN.hide()
			$PlayersInventory1.hide()
			$PlayersInventory2.hide()
			$PlayersInventory3.show()
			if Globals.CSelect == 0:
				$PlayersInventory3/ITEM1.add_color_override("font_color", Color(255,255,0,1))
				$PlayersInventory3/ITEM2.add_color_override("font_color", Color(255,255,255,1))
			elif Globals.CSelect == 1:
				$PlayersInventory3/ITEM1.add_color_override("font_color", Color(255,255,255,1))
				$PlayersInventory3/ITEM2.add_color_override("font_color", Color(255,255,0,1))
	if Globals.pageselect == 2:
		#if Globals.selecting == 0:
			$PlayersMenu.hide()
			$PlayersSTAT.show()
			$PlayersUTSKINS.hide()
			$PlayersSKIN.hide()
			$PlayersInventory1.hide()
			$PlayersInventory2.hide()
			$PlayersInventory3.hide()
	if Globals.pageselect == 4:
		if Globals.selecting == 0:
			$PlayersMenu.hide()
			$PlayersSTAT.hide()
			$PlayersUTSKINS.hide()
			$PlayersSKIN.show()
			$PlayersInventory1.hide()
			$PlayersInventory2.hide()
			$PlayersInventory3.hide()
			if Globals.CSelect == 0:
				$PlayersSKIN/AU_UT.add_color_override("font_color", Color(255,255,0,1))
				$PlayersSKIN/AU_UF.add_color_override("font_color", Color(255,255,255,1))
				$PlayersSKIN/AU_US.add_color_override("font_color", Color(255,255,255,1))
			if Globals.CSelect == 1:
				$PlayersSKIN/AU_UT.add_color_override("font_color", Color(255,255,255,1))
				$PlayersSKIN/AU_UF.add_color_override("font_color", Color(255,255,0,1))
				$PlayersSKIN/AU_US.add_color_override("font_color", Color(255,255,255,1))
			if Globals.CSelect == 2:
				$PlayersSKIN/AU_UT.add_color_override("font_color", Color(255,255,255,1))
				$PlayersSKIN/AU_UF.add_color_override("font_color", Color(255,255,255,1))
				$PlayersSKIN/AU_US.add_color_override("font_color", Color(255,255,0,1))
	if Globals.pageselect == 5:
		if Globals.selecting == 0:
			$PlayersMenu.hide()
			$PlayersSTAT.hide()
			$PlayersUTSKINS.show()
			$PlayersSKIN.hide()
			if Globals.CSelect == 0:
				$PlayersUTSKINS/FRISK.add_color_override("font_color", Color(255,255,0,1))
				$PlayersUTSKINS/CHARA.add_color_override("font_color", Color(255,255,255,1))
				$PlayersUTSKINS/CHRIS.add_color_override("font_color", Color(255,255,255,1))
			if Globals.CSelect == 1:
				$PlayersUTSKINS/FRISK.add_color_override("font_color", Color(255,255,255,1))
				$PlayersUTSKINS/CHARA.add_color_override("font_color", Color(255,255,0,1))
				$PlayersUTSKINS/CHRIS.add_color_override("font_color", Color(255,255,255,1))
			if Globals.CSelect == 2:
				$PlayersUTSKINS/FRISK.add_color_override("font_color", Color(255,255,255,1))
				$PlayersUTSKINS/CHARA.add_color_override("font_color", Color(255,255,255,1))
				$PlayersUTSKINS/CHRIS.add_color_override("font_color", Color(255,255,0,1))
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _hide_inv():
	self.hide()
	inv_vis = 1
	Globals.inv_open = 0
	Globals.pageselect = 0
	UpdateInv()
	Globals.PlayerCanMove = 0
