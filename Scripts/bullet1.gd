extends Area2D

func _on_Bullet_body_entered(body):
	if "KinematicBody2D" in str(body):
		Globals.damage_player(3)
	pass # Replace with function body.
