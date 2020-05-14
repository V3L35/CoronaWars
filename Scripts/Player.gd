extends KinematicBody2D

const SPEED = 150

var motion = Vector2()


func _physics_process(delta):
	move_and_slide(motion)
	update_motion(delta)
	animate()
	
func update_motion(delta):
#	look_at(get_global_mouse_position())
	
	motion.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left")) 
	motion.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up")) 
	
	motion = motion.normalized()
	
	global_position += motion * SPEED * delta
	

func animate():
	$AnimatedSprite.play()