extends Particles2D

const SPEED = 150

func _ready():
	set_as_toplevel(true)
	global_position = get_parent().global_position

func _process(delta):
	position.y += SPEED * delta
	manage_collision()

func manage_collision():
	var collider = $Hitbox.get_overlapping_bodies()
	for objects in collider:
		if objects.name == "Player":
			get_tree().change_scene("res://Scenes/GameOver.tscn")
		queue_free()


func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()
