extends KinematicBody2D

var speed = 70
var motion = Vector2()

var hp = 3
var stun = false

var death_particle = preload("res://Scenes/ParticleDeath.tscn")

func _process(delta):
	$AnimatedSprite.play("idle")
	if Global.player != null and stun == false:
		motion = global_position.direction_to(Global.player.global_position)
	elif stun:
		motion = lerp(motion, Vector2(0, 0), 0.3)
		
	global_position += motion * speed * delta
	
	if hp <= 0:
		Global.points += 10
		if Global.noode_creation_parent != null:
			var death_particle_instance = Global.instance_node(death_particle, global_position, Global.noode_creation_parent)
			death_particle_instance.rotation = motion.angle()
		queue_free()


func _on_Hitbox_area_entered(area):
	if area.is_in_group("Enemy_damager") and stun == false:
		$AnimatedSprite.modulate = Color.gray
		motion = -motion * 4
		hp -= 1
		$Stun_Timer.start()
		stun = true
		area.get_parent().queue_free()

func _on_Stun_Timer_timeout():
	$AnimatedSprite.modulate = Color("ffffff")
	stun = false
