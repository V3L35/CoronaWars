extends "res://Scripts/Enemy_core.gd"

var timeout = false
var shield_up = false
var is_destroyed = false

func _process(delta):
#	if $AnimatedSprite/RayCast2D.is_colliding():
	fire()

func fire():
	if not timeout: 
		$AnimatedSprite/RayCast2D.add_child(load("res://Scenes/Projectile_boss.tscn").instance())
		$Reload_time.start()
		timeout = true

func big_projectile():
	shield_up = true
	$AnimatedSprite.self_modulate = Color.red
	$spr_shield.visible = true
	$Shield_timer.start()

func _on_Reload_time_timeout():
	timeout = false

func _on_Boss_Hitbox_area_entered(area):
	if area.is_in_group("Enemy_damager") and not shield_up:
		$Stun_Timer.start()
		$AnimatedSprite.self_modulate = Color.gray
		motion = -motion * 15
		hp -= 1
		area.get_parent().queue_free()
#	elif area.is_in_group("Enemy_damager_ultra"):
#		$AnimatedSprite.modulate = Color.azure
#		hp -= 5

func _on_Stun_Timer_timeout():
	$AnimatedSprite.self_modulate = Color("ffffff")
	stun = false


func _on_Shield_timer_timeout():
	shield_up = false
	$AnimatedSprite.self_modulate = Color("ffffff")
	$spr_shield.visible = false
