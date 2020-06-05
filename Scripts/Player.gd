extends KinematicBody2D

const SPEED = 150
var fireball = preload("res://Scenes/Projectile2.tscn")
var motion = Vector2()

var attack_play = false
var can_shoot = true

var dead = false

func _ready():
	Global.player = self

func _physics_process(delta):
	move_and_slide(motion)
	update_motion(delta)
	shoot()
	if not attack_play:
		animate(motion)

func _input(event):
	if Input.is_action_just_pressed("click"):
		$ShootSFX.play()
		attack_play = true
		$AnimatedSprite.play("shoot")

func update_motion(delta):
#	look_at(get_global_mouse_position())
	
	motion.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left")) 
	motion.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up")) 
	
	motion = motion.normalized()
	
	global_position.x = clamp(global_position.x, -126, 766)
	global_position.y = clamp(global_position.y, -66, 416)
	
	if dead == false:
		global_position += motion * SPEED * delta
	
func shoot():
	if Input.is_action_just_pressed("click") and Global.noode_creation_parent != null and can_shoot and not dead:
		Global.instance_node(fireball, global_position, Global.noode_creation_parent)
		$Reload_speed.start()
		can_shoot = false
		
func animate(motion):
	$AnimatedSprite.play("idle")

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
		yield(get_tree().create_timer(1), "timeout")
		get_tree().change_scene("res://Scenes/GameOver.tscn")
		
		Global.points = 0

