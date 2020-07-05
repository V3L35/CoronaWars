extends KinematicBody2D

const SPEED = 150
var fireball = preload("res://Scenes/Projectile2.tscn")
var blue_flame = preload("res://Scenes/MagicFlame.tscn")
var motion = Vector2()
var specialized_position = Vector2()

var attack_play = false
var can_shoot = true


var dead = false

func _ready():
	Global.player = self


# warning-ignore:unused_argument
func _process(delta):
	if not attack_play:
		animate(motion)
	if Input.is_action_just_pressed("click"):
		$ShootSFX.play()
		attack_play = true
		$AnimatedSprite.play("shoot")
	
func _physics_process(delta):
	move_and_slide(motion)
	update_motion(delta)
	shoot()

func update_motion(delta):
#	look_at(get_global_mouse_position())
	motion.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left")) 
	motion.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up")) 
	
	motion = motion.normalized()
	
	global_position.x = clamp(global_position.x, 20, 620)
	global_position.y = clamp(global_position.y, 15, 345)
	specialized_position = Vector2(global_position.x, global_position.y-60)
	
	if dead == false:
		global_position += motion * SPEED * delta
	
func shoot():
	if Input.is_action_just_pressed("click") and Global.noode_creation_parent != null and can_shoot and not dead:
		if Global.flame == false:
			Global.instance_node(fireball, global_position, Global.noode_creation_parent)
			$Reload_speed.start()
			can_shoot = false
		elif Global.flame == true:
			Global.instance_node(blue_flame, specialized_position, Global.noode_creation_parent)
			$Reload_speed.start()
			can_shoot = false

func animate(motion):
	$AnimatedSprite.play("stand")

func _on_Reload_speed_timeout():
	can_shoot = true

func _on_AnimatedSprite_animation_finished():
	attack_play = false

func _exit_tree():
	Global.player = null

func _on_Area2D_area_entered(area):
	if area.is_in_group("Enemy"):
		visible = false
		dead = true
		Global.flame = false
		Global.save_game()
		yield(get_tree().create_timer(1), "timeout")
		get_tree().change_scene("res://Scenes/GameOver.tscn")
		Global.points = 0
	elif area.is_in_group("Player_damager"):
		visible = false
		dead = true
		Global.flame = false
		Global.save_game()
		yield(get_tree().create_timer(1), "timeout")
		get_tree().change_scene("res://Scenes/GameOver.tscn")
		Global.points = 0
	elif area.is_in_group("Player_damager_small"):
		visible = false
		dead = true
		Global.flame = false
		Global.save_game()
		yield(get_tree().create_timer(1), "timeout")
		get_tree().change_scene("res://Scenes/GameOver.tscn")
#func _input(event):
#	if event is InputEventScreenDrag:
#		motion = event.relative
#		motion = motion.normalized()
#		global_position += motion * 5
