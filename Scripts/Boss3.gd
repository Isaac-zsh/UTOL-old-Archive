extends AnimatedSprite

var bosshp = 150
var bossmaxhp = 150
var can_attack = false
var boss_name = ""
var boss_attacked = []
var boss_attacks = []
var boss_acts = []
var random_attacks = true
var which_attack = ""
var rng = RandomNumberGenerator.new()
var attack_max = 0

func _ready():
	boss_name = "test"
pass

func _process(delta):
	if boss_attacked.size() -1 == attack_max:
		boss_attacked = []
pass

func _rnd_attack(num):
	attack_max = boss_attacks.size() -1
	rng.randomize()

	which_attack = boss_attacks[rng.randi_range(0, attack_max)]
	if !boss_attacked.has(which_attack):
		boss_attacked.append(which_attack)
		_do_an_attack()
	elif boss_attacked.has(which_attack):
		_rnd_attack(0)

func _select_attacks():
	if boss_name == "test":
		random_attacks = true
		boss_attacks = ["throw_a_knife", "throw_bullets"]
		_rnd_attack(0)
		boss_acts = ["Check"]
	pass

func _do_an_attack():
	get_parent().get_parent().attacks.append(which_attack)
	get_parent().get_parent()._set_wait_time()
	get_node("../"+self.name+"Attacks/"+which_attack).play_attack()
pass

func _stop_attacks():
	get_node("../"+self.name+"Attacks/"+which_attack).stop_attack()
