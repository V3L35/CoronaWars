extends Node


func _on_YES_pressed():
	if Global.points >= 2020*Global.num_level:
		get_tree().change_scene("res://Scenes/Arena_boss.tscn")
	else:
		get_tree().change_scene("res://Scenes/Arena.tscn")


func _on_NO_pressed():
	get_tree().quit()

#func _notification(what):
#	if (what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST):
#		Global.save_game()
#		get_tree().quit() 
