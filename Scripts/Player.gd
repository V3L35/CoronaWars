extends KinematicBody2D

const SPEED = 150
var fireball = preload("res://Scenes/Projectile2.tscn")
var motion = Vector2()

var attack_play = false
var can_shoot = true

func _physics_process(delta):
	update_motion(delta)
	shoot()
	if not attack_play:
		animate(motion)

func _input(event):
	if event.is_action_pressed("click"):
		attack_play = true
		$AnimatedSprite.play("shoot")

func update_motion(delta):
#	look_at(get_global_mouse_position())
	
	motion.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left")) 
	motion.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up")) 
	
	motion = motion.normalized()
	
	global_position += motion * SPEED * delta
	
func shoot():
	if Input.is_action_just_pressed("click") and Global.noode_creation_parent != null and can_shoot:
		Global.instance_node(fireball, global_position, Global.noode_creation_parent)
		$Reload_speed.start()
		can_shoot = false
		
func animate(motion):
	$AnimatedSprite.play("idle")

func _on_Reload_speed_timeout():
	can_shoot = true


func _on_AnimatedSprite_animation_finished():
	attack_play = false
