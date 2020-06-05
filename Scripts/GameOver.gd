extends Node


func _on_YES_pressed():
	get_tree().change_scene("res://Scenes/Arena.tscn")


func _on_NO_pressed():
	get_tree().quit()
