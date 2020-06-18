extends AnimatedSprite

func _ready():
	pass


func _on_Hitbox_area_entered(area):
	if area.is_in_group("Player") and Global.flame == false:
		Global.flame = true
		$Flame_life_cycle.start()
		$Flame_despawn_timer.set_paused(true)
		move_local_x(2000)
		move_local_y(2000)
		hide()
		


func _on_Flame_life_cycle_timeout():
	Global.flame = false
	$Flame_despawn_timer.set_paused(false)


func _on_Flame_despawn_timer_timeout():
	queue_free()
