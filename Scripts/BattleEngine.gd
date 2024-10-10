extends Node2D

var button_pos = 0
var act_pos = 0
var fight_options_pos = 1
var Move = 0
var bossnum = 3
var weaponlv = 5
var playable_bosses = []
var boss_spawn_default = true
var can_attack = true
var vs = 0
var hptimeoutnum = 99
var boss_attacks = true
var attacks = []
var boss_selected = 2
var last_selected = 1
var can_select_boss = false
var can_select_act = false
var once1 = true
var boss_position_follow = true
var can_go_up = false

func _ready():
	can_select_boss = true
	can_select_act = true
	if boss_spawn_default == true:
		_spawn_d_bosses(bossnum)
	_set_max_hp()
	_set_hp(0)
	_exec_boss(bossnum)
	_hide_options(0)
	$Player._turn_off_pypr(1)
	_change_soul_pos_in_buttons(3)
	pass

func _spawn_d_bosses(num):
	if num == 1:
		$Attackers/Boss1.can_attack = true
		$Attackers/Boss2.can_attack = false
		$Attackers/Boss3.can_attack = false
		playable_bosses = [1]
	elif num == 2:
		$Attackers/Boss1.can_attack = true
		$Attackers/Boss2.can_attack = true
		$Attackers/Boss3.can_attack = false
		playable_bosses = [1, 2]
	elif num == 3:
		$Attackers/Boss1.can_attack = true
		$Attackers/Boss2.can_attack = true
		$Attackers/Boss3.can_attack = true
		playable_bosses = [1, 2, 3]
	pass

func _input(event):
	if Move == 0:
		if Input.is_action_just_pressed("ui_right"):
			_change_soul_pos_in_buttons(0)
		elif Input.is_action_just_pressed("ui_left"):
			_change_soul_pos_in_buttons(1)
		if Input.is_action_just_pressed("PCInteract"):
			if boss_selected == 1:
				last_selected = 1
			elif boss_selected == 2:
				last_selected = 2
			elif boss_selected == 3:
				last_selected = 3
			can_select_boss = false
			_trigger_action_from_buttons()
	elif Move == 1:
		if can_select_boss == true:
			if Input.is_action_just_pressed("ui_left"):
				_change_soul_fight_pos(0)
			elif Input.is_action_just_pressed("ui_right"):
				_change_soul_fight_pos(1)
			if Input.is_action_just_pressed("PCInteract"):
				can_select_boss = false
				if button_pos == 0:
					_attack_bar()
				elif button_pos == 1:
					_act_select()
					pass
				$Player/Soul.hide()
			if Input.is_action_just_pressed("ui_running"):
				can_select_boss = false
				_revert_to_buttons(0)
				_go_down()
	elif Move == 2:
		if Input.is_action_just_pressed("PCInteract"):
			if $Attacking/AttackLine/move_line.is_playing():
				_boss_attack(boss_selected)
	elif Move == 5:
		if Input.is_action_just_pressed("ui_up"):
			_change_selected_act(0)
		elif Input.is_action_just_pressed("ui_down"):
			_change_selected_act(1)
		pass

func _go_down():
	#_move_boss_bc_yes()
	if bossnum == 3:
		get_node("Attackers/Boss"+str(boss_selected)+"/Scale").play("down")
	elif bossnum == 2:
			get_node("Attackers/Boss"+str(boss_selected)+"/Scale").play("down")
	elif bossnum == 1:
		get_node("Attackers/Boss"+str(boss_selected)+"/Scale").play("down")
	pass

func exec_line():
	if Move == 2:
		if true:
			$Attacking/AttackLine.play("default")
			$Attacking/AttackLine.show()
			$Attacking/AttackLine/move_line.play("move_to_right")
	pass

func _hide_options(num):
	if num == 0:
		$BattleLayout/Panel/face.show()
		$BattleLayout/Panel/line.show()
		$BattleLayout/Panel/HPImage.show()
		$BattleLayout/Panel/HealthBar.show()
		$BattleLayout/Panel/LV.show()
		$BattleLayout/Options/NoOptions.show()
		$Attacking/AB.hide()
		$Attacking/AttackLine.hide()
		$Attackers/HPT1.hide()
		$Attackers/HPT2.hide()
		$Attackers/HPT3.hide()
		$Player/Soul.show()
		$BattleLayout/Options/NoOptions/text.text = "* Test Fight momento"
	pass

func _show_options(num):
	if num == 0:
		$BattleLayout/Options/NoOptions/text.text = "Select an enemie with arrows"
		$Attackers/HPT1.hide()
		$Attackers/HPT2.hide()
		$Attackers/HPT3.hide()
		$BattleLayout/HPStatsFade.hide()
		$Player/Soul.hide()
		_exec_boss(bossnum)
	elif num == 1:
		$Attacking/AB.show()
		$BattleLayout/Options/NoOptions.hide()
		$BattleLayout/Options/Fight.hide()
		$Attacking/AB/resize.play("expand")
		Move = 2
		$Attackers/HPT1.hide()
		$Attackers/HPT2.hide()
		$Attackers/HPT3.hide()
	elif num == 2:
		$Attackers/HPT1.hide()
		$Attackers/HPT2.hide()
		$Attackers/HPT3.hide()
		$Attacking/AttackLine.hide()
		$Attacking/AB/resize.play("shrink")
	elif num == 3:
		$Attackers/HPT1.hide()
		$Attackers/HPT2.hide()
		$Attackers/HPT3.hide()
		$Attacking/AttackLine.hide()
		$Attacking/AB/resize.play("shrink")
	elif num == 4:
		$Player/Soul.show()
		$Attackers/HPT1.hide()
		$Attackers/HPT2.hide()
		$Attackers/HPT3.hide()
		$BattleLayout/HPStatsFade.show()
		$BattleLayout/Panel/face.hide()
		$BattleLayout/Panel/line.hide()
		$BattleLayout/Panel/HPImage.hide()
		$BattleLayout/Panel/HealthBar.hide()
		$BattleLayout/Panel/LV.hide()
		if playable_bosses.has(1):
			$Attackers/Boss1._select_attacks()
		if playable_bosses.has(2):
			$Attackers/Boss2._select_attacks()
		if playable_bosses.has(3):
			$Attackers/Boss3._select_attacks()
		if !playable_bosses.has(1) and !playable_bosses.has(2) and !playable_bosses.has(3):
			_revert_to_buttons(0)
	elif num == 5:
		$BattleLayout/Options/NoOptions.hide()
		$BattleLayout/Options/Act.show()
		Move = 5
	pass

func _revert_to_buttons(num):
	$Attackers/Boss1/shadow.show()
	$Attackers/Boss2/shadow.show()
	$Attackers/Boss3/shadow.show()
	can_go_up = true
	$BattleLayout/HPStatsFade.hide()
	Move = 0
	$Player._turn_off_pypr(1)
	button_pos = 0
	_change_soul_pos_in_buttons(2)
	bossnum = playable_bosses.size()
	_play_sfx(0)
	_exec_boss(bossnum)
	_hide_options(0)
	_undo_protection()
	if num == 1:
		$BattleLayout/Panel/AnimationPlayer.play("shrink")
	pass

func _go_up():
	if boss_selected == 1:
		$Attackers/Boss1/GoUp.play("goup")
	elif boss_selected == 2:
		$Attackers/Boss2/GoUp.play("goup")
	elif boss_selected == 3:
		$Attackers/Boss3/GoUp.play("goup")
	pass

func _start_fight():
	_move_boss_bc_yes()
	get_node("Attackers/Boss"+str(boss_selected)+"/Scale").play("down")
	_change_soul_mode(0)
	pass

func _move_boss_bc_yes():
	if bossnum == 3:
		if get_node("Attackers/Boss"+str(playable_bosses[0])).position.x != 352:
			get_node("Attackers/Boss"+str(playable_bosses[0])+"/Move").get_animation("32").track_set_key_value(0,0, get_node("Attackers/Boss"+str(playable_bosses[0])).position)
			get_node("Attackers/Boss"+str(playable_bosses[0])+"/Move").play("32")
	elif bossnum == 2:
		if playable_bosses.has(1) and playable_bosses.has(3):
			if once1 == true:
				boss_position_follow = false
				once1 = false
		elif playable_bosses.has(2) and playable_bosses.has(3):
			boss_position_follow = true
		elif playable_bosses.has(1) and playable_bosses.has(2):
			boss_position_follow = true
		if get_node("Attackers/Boss"+str(playable_bosses[0])).position.x != 415.5:
			get_node("Attackers/Boss"+str(playable_bosses[0])+"/Move").get_animation("movetocenter").track_set_key_value(0,0, get_node("Attackers/Boss"+str(playable_bosses[0])).position)
			get_node("Attackers/Boss"+str(playable_bosses[0])+"/Move").play("movetocenter")
	elif bossnum == 1:
		if get_node("Attackers/Boss"+str(playable_bosses[0])).position.x != 479:
			get_node("Attackers/Boss"+str(playable_bosses[0])+"/Move").get_animation("31").track_set_key_value(0,0, get_node("Attackers/Boss"+str(playable_bosses[0])).position)
			get_node("Attackers/Boss"+str(playable_bosses[0])+"/Move").play("31")
		pass

func _change_soul_mode(num):
	if num == 0:
		$BattleLayout/Panel/AnimationPlayer.play("expand")
		$Player/Soul.show()
		$Player._turn_off_pypr(0)
		$Player/Soul/AnimationPlayer.play("FightPos")
		_show_options(4)

func _exec_boss(num):
	if playable_bosses.has(1):
		$Attackers/Boss1.show()
		$BattleLayout/Options/Fight/Fight/MonsterName1.show()
		$Attackers/HPT1.show()
	elif !playable_bosses.has(1):
		$Attackers/Boss1.hide()
		$BattleLayout/Options/Fight/Fight/MonsterName1.hide()
		$Attackers/HPT1.hide()
		_move_boss_bc_yes()
	if playable_bosses.has(2):
		$Attackers/Boss2.show()
		$BattleLayout/Options/Fight/Fight/MonsterName2.show()
		$Attackers/HPT2.show()
	elif !playable_bosses.has(2):
		$Attackers/Boss2.hide()
		$BattleLayout/Options/Fight/Fight/MonsterName2.hide()
		$Attackers/HPT2.hide()
		_move_boss_bc_yes()
		if once1 == true:
			can_select_boss = false
			once1 = false
	if playable_bosses.has(3):
		$Attackers/Boss3.show()
		$BattleLayout/Options/Fight/Fight/MonsterName3.show()
		$Attackers/HPT3.show()
	elif !playable_bosses.has(3):
		$Attackers/Boss3.hide()
		$BattleLayout/Options/Fight/Fight/MonsterName3.hide()
		$Attackers/HPT3.hide()
		_move_boss_bc_yes()
	pass

func _attack_bar():
	_show_options(1)
	_play_sfx(2)
	pass

func _act_select():
	_show_options(5)
	_play_sfx(0)
	pass

func _boss_attack(num):
	if bossnum == 1:
		if playable_bosses.has(1):
			num = 1
		elif playable_bosses.has(2):
			num = 2
		elif playable_bosses.has(3):
			num = 3
	elif bossnum == 2:
		if playable_bosses.has(1) and playable_bosses.has(2):
			if num == 1:
				pass
			elif num == 2:
				num = 2
		elif playable_bosses.has(1) and playable_bosses.has(3):
			if num == 1:
				pass
			elif num == 2:
				num = 3
				pass
		elif playable_bosses.has(2) and playable_bosses.has(3):
			if num == 1:
				num = 2
			elif num == 2:
				num = 3
	if can_attack == true:
		$Attacking/AttackEffects.show()
		$Attacking/AttackEffects.position.x = get_node("Attackers/Boss"+str(num)).position.x
		$Attacking/AttackEffects.position.y = get_node("Attackers/Boss"+str(num)).position.y
		$Attacking/AttackEffects.frame = 0
		$Attacking/AttackEffects.play("Knife")
		can_attack = false
		$Attacking/AttackLine/move_line.stop()
		$Attacking/AttackLine.play("swap")
		_play_sfx(1)
	pass

func _change_soul_pos_in_buttons(dir):
	if Move == 0:
		if dir == 0:
			button_pos += 1
		elif dir == 1:
			button_pos -= 1
		_change_button_sprites(button_pos)
		if dir != 3:
			_play_sfx(0)
	pass

func _change_selected_act(dir):
	if Move == 5:
		if can_select_act == true:
			if dir == 0:
				can_select_act = false
				$BattleLayout/Options/Act/ArrowUp/Scale.play("Scale")
				act_pos += 1
			elif dir == 1:
				can_select_act = false
				$BattleLayout/Options/Act/ArrowDown/Scale.play("Scale")
				act_pos -= 1
			if dir != 3:
				_play_sfx(0)
	pass

func _play_sfx(num):
	if num == 0:
		$SelectB.play()
	elif num == 1:
		$Attacking/Knife.play()
	elif num == 2:
		$SelectO.play()
	pass

func _trigger_action_from_buttons():
	_trigger_options(button_pos)
	pass

func _trigger_options(o):
	_change_button_sprites(4)
	if o == 0 or o == 1:
		Move = 1
		_change_soul_fight_pos(2)
		_show_options(0)
	pass

func _change_soul_fight_pos(dir):
	if Move == 1:
		if dir != 3:
			last_selected = boss_selected
			_play_sfx(0)
		if dir == 0:
			if bossnum != 1:
				boss_selected -= 1
		elif dir == 1:
			if bossnum != 1:
				boss_selected += 1
		if bossnum == 1:
			if boss_selected < 1:
				boss_selected = 3
			elif boss_selected > bossnum:
				boss_selected = 1
		elif bossnum == 2:
			if boss_selected < playable_bosses[0]:
				boss_selected = playable_bosses[1]
			elif boss_selected > playable_bosses[1]:
				boss_selected = playable_bosses[0]
			if playable_bosses.has(1) and playable_bosses.has(3):
				if boss_selected == 2:
					if last_selected == 1:
						boss_selected = 3
					elif last_selected == 3:
						boss_selected = 1
		elif bossnum == 3:
			if boss_selected < 1:
				boss_selected = 3
			elif boss_selected > bossnum:
				boss_selected = 1
		if !playable_bosses.has(boss_selected):
			boss_selected = playable_bosses[0]
	#if button_pos == 0:
	_select_fight_option()
	pass

func _select_fight_option():
	if Move == 1:
			if boss_selected == 1:
				if bossnum != 1:
					get_node("Attackers/Boss"+str(playable_bosses[0])+"/Move").get_animation(str(bossnum)+"1").track_set_key_value(0,0, get_node("Attackers/Boss"+str(playable_bosses[0])).position)
					get_node("Attackers/Boss"+str(playable_bosses[0])+"/Move").play(str(bossnum)+"1")
				else:
					get_node("Attackers/Boss"+str(playable_bosses[0])+"/Move").get_animation("31").track_set_key_value(0,0, get_node("Attackers/Boss"+str(playable_bosses[0])).position)
					get_node("Attackers/Boss"+str(playable_bosses[0])+"/Move").play("31")
				if last_selected == 0:
					get_node("Attackers/Boss"+str(boss_selected)+"/Scale").play("up")
				else:
					get_node("Attackers/Boss"+str(boss_selected)+"/Scale").play("up")
					if last_selected != boss_selected:
						get_node("Attackers/Boss"+str(last_selected)+"/Scale").play("down")
					can_select_boss = false
			elif boss_selected == 2:
				if bossnum != 1:
					get_node("Attackers/Boss"+str(playable_bosses[0])+"/Move").get_animation(str(bossnum)+"2").track_set_key_value(0,0, get_node("Attackers/Boss"+str(playable_bosses[0])).position)
					get_node("Attackers/Boss"+str(playable_bosses[0])+"/Move").play(str(bossnum)+"2")
				else:
					get_node("Attackers/Boss"+str(playable_bosses[0])+"/Move").get_animation("31").track_set_key_value(0,0, get_node("Attackers/Boss"+str(playable_bosses[0])).position)
					get_node("Attackers/Boss"+str(playable_bosses[0])+"/Move").play("31")
				if last_selected == 0:
					get_node("Attackers/Boss"+str(boss_selected)+"/Scale").play("up")
				else:
					get_node("Attackers/Boss"+str(boss_selected)+"/Scale").play("up")
					if last_selected != boss_selected:
						get_node("Attackers/Boss"+str(last_selected)+"/Scale").play("down")
					can_select_boss = false
			elif boss_selected == 3:
				if bossnum != 1:
					get_node("Attackers/Boss"+str(playable_bosses[0])+"/Move").get_animation(str(bossnum)+"3").track_set_key_value(0,0, get_node("Attackers/Boss"+str(playable_bosses[0])).position)
					get_node("Attackers/Boss"+str(playable_bosses[0])+"/Move").play(str(bossnum)+"3")
				else:
					get_node("Attackers/Boss"+str(playable_bosses[0])+"/Move").get_animation("31").track_set_key_value(0,0, get_node("Attackers/Boss"+str(playable_bosses[0])).position)
					get_node("Attackers/Boss"+str(playable_bosses[0])+"/Move").play("31")
				if last_selected == 0:
					get_node("Attackers/Boss"+str(boss_selected)+"/Scale").play("up")
				else:
					get_node("Attackers/Boss"+str(boss_selected)+"/Scale").play("up")
					if last_selected != boss_selected:
						get_node("Attackers/Boss"+str(last_selected)+"/Scale").play("down")
					can_select_boss = false
	pass

func _change_button_sprites(num):
	if num == 0:
		$Player/Soul/AnimationPlayer.play("Fight")
		$BattleLayout/Fight.play("2")
		$BattleLayout/Act.play("1")
		$BattleLayout/Item.play("1")
		$BattleLayout/Mercy.play("1")
	elif num == 1:
		$Player/Soul/AnimationPlayer.play("Act")
		$BattleLayout/Fight.play("1")
		$BattleLayout/Act.play("2")
		$BattleLayout/Item.play("1")
		$BattleLayout/Mercy.play("1")
	elif num == 2:
		$Player/Soul/AnimationPlayer.play("Item")
		$BattleLayout/Fight.play("1")
		$BattleLayout/Act.play("1")
		$BattleLayout/Item.play("2")
		$BattleLayout/Mercy.play("1")
	elif num == 3:
		$Player/Soul/AnimationPlayer.play("Mercy")
		$BattleLayout/Fight.play("1")
		$BattleLayout/Act.play("1")
		$BattleLayout/Item.play("1")
		$BattleLayout/Mercy.play("2")
	elif num == 4:
		$BattleLayout/Fight.play("1")
		$BattleLayout/Act.play("1")
		$BattleLayout/Item.play("1")
		$BattleLayout/Mercy.play("1")
	pass

func _set_max_hp():
	$Attackers/HPT1.max_value = $Attackers/Boss1.bossmaxhp
	$Attackers/HPT2.max_value = $Attackers/Boss2.bossmaxhp
	$Attackers/HPT3.max_value = $Attackers/Boss3.bossmaxhp

func _set_hp(num):
	if num == 0:
		$Attackers/HPT1.value = $Attackers/Boss1.bosshp
		$Attackers/HPT2.value = $Attackers/Boss2.bosshp
		$Attackers/HPT3.value = $Attackers/Boss3.bosshp
	if num == 1:
		pass

func _process(delta):
	if bossnum == 0:
		boss_attacks = false
	$Attackers/HPT1.rect_position.x = $Attackers/Boss1.position.x - 48
	$Attackers/HPT1.rect_position.y = $Attackers/Boss1.position.y - 72 * $Attackers/Boss1.scale.x / 1.2
	$Attackers/HPT2.rect_position.x = $Attackers/Boss2.position.x - 48
	$Attackers/HPT2.rect_position.y = $Attackers/Boss2.position.y - 72 * $Attackers/Boss2.scale.x / 1.2
	$Attackers/HPT3.rect_position.x = $Attackers/Boss3.position.x - 48
	$Attackers/HPT3.rect_position.y = $Attackers/Boss3.position.y - 72 * $Attackers/Boss3.scale.x / 1.2
	if boss_position_follow == true:
		if bossnum == 3:
			$Attackers/Boss2.position.x = $Attackers/Boss1.position.x + 127
			$Attackers/Boss3.position.x = $Attackers/Boss2.position.x + 127
		elif bossnum == 2:
			if playable_bosses.has(1) and playable_bosses.has(3):
				$Attackers/Boss3.position.x = $Attackers/Boss1.position.x + 127
			elif playable_bosses.has(2) and playable_bosses.has(3):
				$Attackers/Boss3.position.x = $Attackers/Boss2.position.x + 127
			elif playable_bosses.has(1) and playable_bosses.has(2):
				$Attackers/Boss2.position.x = $Attackers/Boss1.position.x + 127
	if GameMusics.hurt_sfx == 1:
		$Player/Soul.play("damaged")
		$BattleLayout/Smol_fade.play("fade")
	$BattleLayout/Panel/HealthBar.value = Globals.hp
	$BattleLayout/Panel/HealthBar.max_value = Globals.maxhp
	$BattleLayout/HP.text = str(Globals.hp)+" / "+str(Globals.maxhp)
	$BattleLayout/Panel/LV.text = "LV "+str(Globals.lv)
	$BattleLayout/HPStatsFade/HealthBar2.max_value = Globals.maxhp
	$BattleLayout/HPStatsFade/HealthBar2.value = Globals.hp
	$BattleLayout/HPStatsFade/HP2.text = str(Globals.hp)+" / "+str(Globals.maxhp)
	_set_max_hp()
	_set_hp(1)
	if vs == 16:
		$BattleLayout/Options/NoOptions/Generic1.stop()
	if Move == 0:
		if button_pos > 3:
			button_pos = 0
			_change_soul_pos_in_buttons(2)
		elif button_pos < 0:
			button_pos = 3
			_change_soul_pos_in_buttons(2)
	else:
		last_selected = 0
	pass

func _on_AttackEffects_animation_finished():
	$Attacking/AttackEffects.hide()
	hptimeoutnum = boss_selected
	$Attacking/dh_play.start()
	pass

func _on_dh_play_timeout():
	if bossnum == 1:
		if playable_bosses.has(1):
			hptimeoutnum = 1
		elif playable_bosses.has(2):
			hptimeoutnum = 2
		elif playable_bosses.has(3):
			hptimeoutnum = 3
	elif bossnum == 2:
		if playable_bosses.has(1) and playable_bosses.has(2):
			if hptimeoutnum == 1:
				hptimeoutnum = 1
			elif hptimeoutnum == 2:
				hptimeoutnum = 2
		elif playable_bosses.has(1) and playable_bosses.has(3):
			if hptimeoutnum == 1:
				hptimeoutnum = 1
			elif hptimeoutnum == 2:
				hptimeoutnum = 3
		elif playable_bosses.has(2) and playable_bosses.has(3):
			if hptimeoutnum == 1:
				hptimeoutnum = 2
			elif hptimeoutnum == 2:
				hptimeoutnum = 3
	get_node("Attackers/HPT"+str(hptimeoutnum)).show()
	$Attacking/DeathHit.play()
	get_node("Attackers/Boss"+str(hptimeoutnum)+"/shake").play("shake")
	boss_position_follow = false
	if $Attacking/AttackLine.position.x < 418:
		get_node("Attackers/Boss"+str(hptimeoutnum)).bosshp -= 3 * weaponlv
	elif $Attacking/AttackLine.position.x > 418 and $Attacking/AttackLine.position.x < 493:
		get_node("Attackers/Boss"+str(hptimeoutnum)).bosshp -= 6 * weaponlv
	elif $Attacking/AttackLine.position.x > 493 and $Attacking/AttackLine.position.x < 546:
		get_node("Attackers/Boss"+str(hptimeoutnum)).bosshp -= 9 * weaponlv
	elif $Attacking/AttackLine.position.x > 546 and $Attacking/AttackLine.position.x < 587:
		get_node("Attackers/Boss"+str(hptimeoutnum)).bosshp -= 13 * weaponlv
	elif $Attacking/AttackLine.position.x > 587 and $Attacking/AttackLine.position.x < 630:
		get_node("Attackers/Boss"+str(hptimeoutnum)).bosshp -= 9 * weaponlv
	elif $Attacking/AttackLine.position.x > 630 and $Attacking/AttackLine.position.x < 708:
		get_node("Attackers/Boss"+str(hptimeoutnum)).bosshp -= 6 * weaponlv
	elif $Attacking/AttackLine.position.x > 708 and $Attacking/AttackLine.position.x < 761:
		get_node("Attackers/Boss"+str(hptimeoutnum)).bosshp -= 3 * weaponlv
	$Attacking/atk_play.start()
	pass

func _on_atk_play_timeout():
	can_attack = true
	pass

func _on_visible_text_timeout():
	vs += 1
	$BattleLayout/Options/NoOptions/text.set_visible_characters(vs)
	pass

func _on_resize_animation_finished(anim_name):
	if anim_name == "expand":
		Move = 2
		exec_line()
	elif anim_name == "shrink":
		if boss_attacks == false:
			_revert_to_buttons(0)
		elif boss_attacks == true:
			_start_fight()
	pass 

func _on_lower_the_hp_timeout():
	if playable_bosses.has(1):
		if $Attackers/HPT1.value <= 0:
			playable_bosses.erase(1)
			bossnum = playable_bosses.size()
			_exec_boss(bossnum)
	if playable_bosses.has(2):
		if $Attackers/HPT2.value <= 0:
			playable_bosses.erase(2)
			bossnum = playable_bosses.size()
			_exec_boss(bossnum)
	if playable_bosses.has(3):
		if $Attackers/HPT3.value <= 0:
			playable_bosses.erase(3)
			bossnum = playable_bosses.size()
			_exec_boss(bossnum)
	if get_node("Attackers/HPT1").value > get_node("Attackers/Boss1").bosshp:
		get_node("Attackers/HPT1").value -= 1
	if get_node("Attackers/HPT2").value > get_node("Attackers/Boss2").bosshp:
		get_node("Attackers/HPT2").value -= 1
	if get_node("Attackers/HPT3").value > get_node("Attackers/Boss3").bosshp:
		get_node("Attackers/HPT3").value -= 1
	pass

func _on_shake_animation_finished(anim_name):
	if anim_name == "shake":
		$Attacking/closea_play.start()
		boss_position_follow = true
	pass

func _on_closea_play_timeout():
	if boss_attacks == true:
		_show_options(3)
	elif boss_attacks == false:
		_show_options(2)
	pass

func _on_move_line_animation_finished(anim_name):
	if anim_name == "move_to_right":
		if boss_attacks == true:
			_show_options(2)
		elif boss_attacks == false:
			_show_options(2)
	pass

func _on_AttackTime_timeout():
	if playable_bosses.has(1):
		$Attackers/Boss1._stop_attacks()
	if playable_bosses.has(2):
		$Attackers/Boss2._stop_attacks()
	if playable_bosses.has(3):
		$Attackers/Boss3._stop_attacks()
	_revert_to_buttons(1)
	attacks = []
	pass 

func _on_Soul_animation_finished():
	_undo_protection()
	pass

func _undo_protection():
	GameMusics.hurt_sfx = 0
	$Player/Soul.play("normal")
	pass

func _set_wait_time():
	var knife = 2.5
	var bullets = 9
	if true:
		if attacks.has("throw_bullets"):
			$Attackers/AttackTime.wait_time = bullets
		else:
			$Attackers/AttackTime.wait_time = knife
	pass

func _on_SelectedBoss_animation_finished(anim_name):
	can_select_boss = true
	pass 

func _on_Move_animation_finished(anim_name):
	can_select_boss = true
	boss_position_follow = true
	pass

func _on_Scale_animation_finished(anim_name):
	if anim_name == "up":
		get_node("Attackers/Boss"+str(boss_selected)+"/shadow").hide()
	if anim_name == "down":
		if Move == 0 or Move == 1:
				if $Attackers/Boss1.scale.x != 2:
					$Attackers/Boss1/shadow.show()
				if $Attackers/Boss2.scale.x != 2:
					$Attackers/Boss2/shadow.show()
				if $Attackers/Boss3.scale.x != 2:
					$Attackers/Boss3/shadow.show()
		else:
			get_node("Attackers/Boss1/shadow").hide()
			get_node("Attackers/Boss2/shadow").hide()
			get_node("Attackers/Boss3/shadow").hide()
			Move = 4
	can_select_boss = true
	boss_position_follow = true
	pass

func _on_Scale2_animation_finished(anim_name):
	if anim_name == "Scale":
		can_select_act = true
	pass # Replace with function body.
