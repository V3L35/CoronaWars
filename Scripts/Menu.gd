extends Node

var difficulty = 0
func _ready():
	$OptionButton.add_item("Easy", 3.3)
	$OptionButton.add_item("Normal", 3.0)
	$OptionButton.add_item("Hard", 2.7)
	$OptionButton.add_item("Very Hard", 2.3)
	$OptionButton.add_item("Insane", 2.0)
	$OptionButton.add_item("Impossible", 1.7)

func _process(delta):
	get_difficulty()
	

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


func get_difficulty():
	difficulty = $OptionButton.get_selected_id()
	Global.Difficulty = difficulty


func _on_Settings_pressed():
	$OptionButton.visible = true
