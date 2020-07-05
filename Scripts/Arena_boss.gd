extends Node2D

var enemy_1 = preload("res://Scenes/Enemy_small.tscn")
var enemy_2 = preload("res://Scenes/Boss_Enemy.tscn")
var flame_1 = preload("res://Scenes/BlueFlame.tscn")


func _ready():
	Global.noode_creation_parent = self
	$Boss/Boss_move.play("move")
	if Global.points > 2500:
		$Enemy_spawn_waves.start()
		$Enemy_spawn_waves.autostart
		
func _exit_tree():
	Global.noode_creation_parent = null

func _process(delta):
	if $Boss == null:
		Global.save_game()
		yield(get_tree().create_timer(1), "timeout")
		get_tree().change_scene("res://Scenes/Victory.tscn")
		Global.Difficulty -= 0.1
		Global.num_level += 1
		$Enemy_spawn_waves.wait_time -= 0.05
	if Global.flame == true:
		Global.flame = false



func _on_Enemy_spawn_waves_timeout():
	var enemy_position = Vector2(rand_range(-160, 670), rand_range(-90, 80))
	while enemy_position.x < 640 and enemy_position.x > -80 and enemy_position.y < 80 and enemy_position.y > -45:
		 enemy_position = Vector2(rand_range(-160, 670), rand_range(-90, 80))
	
	Global.instance_node(enemy_1, enemy_position, self)
