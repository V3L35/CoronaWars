extends Node

func _on_Start_pressed():
	$ClickWait.start()
	$ClickSFX.play()


func _on_Exit_pressed():
	$ClickWait2.start()
	$ClickSFX.play()


func _on_ClickWait_timeout():
	get_tree().change_scene("res://Scenes/Arena.tscn")


func _on_ClickWait2_timeout():
	get_tree().quit()


func _on_Credits_pressed():
	$ClickSFX.play()
	$Popup.popup()
	$WindowDialog.show()


#func _on_Popup_about_to_show():
#	$Control/Popup/WindowDialog.
