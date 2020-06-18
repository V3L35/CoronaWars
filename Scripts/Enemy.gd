extends "res://Scripts/Enemy_core.gd"


func _process(delta):
	$AnimatedSprite.play("idle")
	basic_enemy_movement(delta)
