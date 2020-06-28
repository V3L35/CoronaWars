extends Node


func _on_YES_pressed():
	get_tree().change_scene("res://Scenes/Arena.tscn")


func _on_NO_pressed():
	get_tree().quit()

#func _notification(what):
#	if (what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST):
#		Global.save_game()
#		get_tree().quit() 
