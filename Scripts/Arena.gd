extends Node2D

var enemy_1 = preload("res://Scenes/Enemy.tscn")
var flame_1 = preload("res://Scenes/BlueFlame.tscn")

var er = 1.0
var ge = 1.0
var be = 1.0
var colors = []


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
		$Enemy_spawn_timer.wait_time -= 0.01


func _on_Flame_powerup_spawn_time_timeout():
	var flame_position = Vector2(rand_range(0, 640), rand_range(0, 320))
	Global.instance_node(flame_1, flame_position, self)


func _on_Background_color_timeout():
	colors = change_color(er, ge, be)
	er = colors[0]
	ge = colors[1]
	be = colors[2]
	$TextureRect.modulate = Color(er, ge, be)
	
func change_color(r, g, b):
	if r >= 0.4 and g >= 0.1 and b >= 0.1:
		r= r-0.02 
		g = g-0.03
		b= b-0.03
		return [r, g, b]
	else:
		return [r, g, b]


