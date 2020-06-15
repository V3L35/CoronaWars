extends Node2D

var enemy_1 = preload("res://Scenes/Enemy.tscn")
var flame_1 = preload("res://Scenes/BlueFlame.tscn")

func _ready():
	Global.noode_creation_parent = self

func _exit_tree():
	Global.noode_creation_parent = null


	
func _on_Enemy_spawn_timer_timeout():
	var enemy_position = Vector2(rand_range(-160, 670), rand_range(-90, 390))
	
	while enemy_position.x < 640 and enemy_position.x > -80 and enemy_position.y < 360 and enemy_position.y > -45:
		enemy_position = Vector2(rand_range(-160, 670), rand_range(-90, 390))
		
	Global.instance_node(enemy_1, enemy_position, self)

			
func _on_Enemy_difficulty_timeout():
	if $Enemy_spawn_timer.wait_time > 0.5:
		$Enemy_spawn_timer.wait_time -= 1


func _on_Flame_powerup_spawn_time_timeout():
	var flame_position = Vector2(rand_range(0, 640), rand_range(0, 320))
	Global.instance_node(flame_1, flame_position, self)
