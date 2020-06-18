extends "res://Scripts/Enemy_core.gd"

func _process(delta):
	$AnimatedSprite.play("stand")
	basic_enemy_movement(delta)


func _on_Boss_Hitbox_area_entered(area):
	if area.is_in_group("Enemy_damager"):
		$AnimatedSprite.modulate = Color.gray
		motion = -motion * 15
		hp -= 1
		area.get_parent().queue_free()
	elif area.is_in_group("Enemy_damager_ultra"):
		$AnimatedSprite.modulate = Color.azure
		hp -= 5
