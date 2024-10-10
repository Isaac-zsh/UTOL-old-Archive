extends CanvasLayer

var PlayAudioOnce = 0
var TextBoxStarted = 0
onready var CharacterFace = get_node("NinePatchRect/AnimatedSprite")
onready var DialogueBox_ = $NinePatchRect
onready var DialogueLabel = get_node("NinePatchRect/Label")

func _ready():
	if Globals.inv_open == 0:
		DialogueBox_.hide()
		Globals.PlayerCanMove = 0

func _physics_process(delta):
	if Globals.CharCount < DialogueLabel.get_visible_characters() and PlayAudioOnce == 1 and DialogueLabel.get_visible_characters():
		stop_dialogue_sfx()
func _process(dt):
	if Globals.CharCount < DialogueLabel.get_visible_characters() and PlayAudioOnce == 1 and Input.is_action_just_pressed("PCInteract") and Globals.inv_open == 0 and Globals.ReadingDialogue == 1:
		DialogueBox(0, "bottom")
		Globals.ReadingDialogue = 0
		PlayAudioOnce = 0
		Globals.cantanimate = 1
		Globals.dialogue_open = 0
	elif PlayAudioOnce == 1 and Input.is_action_just_pressed("ui_running") and Globals.inv_open == 0 and Globals.ReadingDialogue == 1:
		DialogueLabel.set_visible_characters(99999)
		PlayAudioOnce = 1
		Globals.ReadingDialogue = 0
		Globals.cantanimate = 1
func DialogueBox(a, b):
	if a == 0 and Globals.inv_open == 0:
		DialogueBox_.hide()
		Globals.cantanimate = 1
		Globals.PlayerCanMove = 0
	elif a == 1 and Globals.inv_open == 0:
		DialogueBox_.show()
		Globals.PlayerCanMove = 1
	if b == "top" and Globals.inv_open == 0:
		DialogueBox_.rect_position.x = 192
		DialogueBox_.rect_position.y = 64
	elif b == "bottom" and Globals.inv_open == 0:
		DialogueBox_.rect_position.x = 192
		DialogueBox_.rect_position.y = 328

func start_dialogue():
	if Globals.ReadingDialogue == 0 and Globals.inv_open == 0:
		play_dialogue_sfx()
		Globals.ReadingDialogue = 1
		DialogueLabel.text = Globals.DialogueText
		DialogueLabel.set_visible_characters(0)
		Globals.dialogue_open = 1

func _on_Timer_timeout():
	DialogueLabel.set_visible_characters(DialogueLabel.get_visible_characters()+1)
	pass # Replace with function body.

func play_dialogue_sfx():
	if Globals.which_character_dialogue == 0:
		PlayAudioOnce = 1
		$NinePatchRect/AnimatedSprite2.play('0')
		get_node("NinePatchRect/Generic2").play()
		CharacterFace.play("Frisk")
	if Globals.which_character_dialogue == 1:
		PlayAudioOnce = 1
		get_node("NinePatchRect/Generic1").play()
		CharacterFace.play("Samuel")
		$NinePatchRect/AnimatedSprite2.play('0')
	if Globals.which_character_dialogue == 2:
		PlayAudioOnce = 1
		get_node("NinePatchRect/Generic1").play()
		CharacterFace.play("Sign")
	if Globals.which_character_dialogue == 3:
		PlayAudioOnce = 1
		$NinePatchRect/AnimatedSprite2.play('0')
		get_node("NinePatchRect/Generic1").play()
		CharacterFace.play("WallText")
	if Globals.which_character_dialogue == 4:
		PlayAudioOnce = 1
		$NinePatchRect/AnimatedSprite2.play('0')
		get_node("NinePatchRect/Generic2").play()
		CharacterFace.play("Chris")
	if Globals.which_character_dialogue == 5:
		PlayAudioOnce = 1
		$NinePatchRect/AnimatedSprite2.play('1')
		get_node("NinePatchRect/Generic2").play()
		CharacterFace.play("Chara")
	if Globals.which_character_dialogue == 256:
		PlayAudioOnce = 1
		$NinePatchRect/AnimatedSprite2.play('0')
		get_node("NinePatchRect/Generic2").play()
		CharacterFace.play("RobTopFreak")

func stop_dialogue_sfx():
	Globals.ReadingDialogue = 1
	if Globals.which_character_dialogue == 0:
		get_node("NinePatchRect/Generic2").stop()
	if Globals.which_character_dialogue == 1:
		get_node("NinePatchRect/Generic1").stop()
	if Globals.which_character_dialogue == 2:
		get_node("NinePatchRect/Generic1").stop()
	if Globals.which_character_dialogue == 3:
		get_node("NinePatchRect/Generic1").stop()
	if Globals.which_character_dialogue == 4:
		get_node("NinePatchRect/Generic2").stop()
	if Globals.which_character_dialogue == 5:
		get_node("NinePatchRect/Generic2").stop()
	if Globals.which_character_dialogue == 256:
		get_node("NinePatchRect/Generic2").stop()
