extends Label

func _process(delta):
	if get_owner().act_pos > get_owner().get_node("Attackers/Boss"+str(get_owner().boss_selected)).boss_acts.size() -1 :
		get_owner().act_pos = 0
		get_owner().get_node("BattleLayout/Options/Act/SelectedAct").text = get_owner().get_node("Attackers/Boss"+str(get_owner().boss_selected)).boss_acts[get_owner().act_pos]
	elif get_owner().act_pos < 0:
		get_owner().act_pos = get_owner().get_node("Attackers/Boss"+str(get_owner().boss_selected)).boss_acts.size()-1
		get_owner().get_node("BattleLayout/Options/Act/SelectedAct").text = get_owner().get_node("Attackers/Boss"+str(get_owner().boss_selected)).boss_acts[get_owner().act_pos]
	else:
		get_owner().get_node("BattleLayout/Options/Act/SelectedAct").text = get_owner().get_node("Attackers/Boss"+str(get_owner().boss_selected)).boss_acts[get_owner().act_pos]
	pass
