extends Control

func _ready():
	_exec_act("Check")
	pass

func _exec_act(act):
	if act == "Check":
		print(str(get_node("../"+str(name.left(5))).boss_name) + " - ATK " + str(get_node("../"+str(name.left(5))).atk) + " DEF " + str(get_node("../"+str(name.left(5))).def) +"\n"+"* I'm very susss"+"\n"+"* sooo sussssssyyyyyy")
	pass
