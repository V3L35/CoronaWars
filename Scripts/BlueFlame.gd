extends AnimatedSprite

func _ready():
	pass


func _on_Hitbox_area_entered(area):
	if area.is_in_group("Player"):
		Global.flame = true
		$Flame_life_cycle.start()
		move_local_x(2000)
		move_local_y(2000)
		hide()
		


func _on_Flame_life_cycle_timeout():
	Global.flame = false
	queue_free()



func _on_Flame_despawn_timer_timeout():
	queue_free()
