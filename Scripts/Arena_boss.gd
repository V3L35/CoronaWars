extends Node2D

var enemy_1 = preload("res://Scenes/Enemy.tscn")
var enemy_2 = preload("res://Scenes/Boss_Enemy.tscn")
var flame_1 = preload("res://Scenes/BlueFlame.tscn")


func _ready():
	Global.noode_creation_parent = self
	$Boss/Boss_move.play("move")

		
func _exit_tree():
	Global.noode_creation_parent = null

func _process(delta):
	if $Boss == null:
		Global.save_game()
		yield(get_tree().create_timer(1), "timeout")
		get_tree().change_scene("res://Scenes/Victory.tscn")
		Global.Difficulty -= 0.1
		Global.num_level += 1
	if Global.flame == true:
		Global.flame = false
