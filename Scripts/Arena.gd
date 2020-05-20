extends Node2D


func _ready():
	Global.noode_creation_parent = self

func _exit_tree():
	Global.noode_creation_parent = null