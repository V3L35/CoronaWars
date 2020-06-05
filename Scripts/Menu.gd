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
