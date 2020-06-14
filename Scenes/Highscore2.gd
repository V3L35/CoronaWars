extends Label

func _input(event):
	if event is InputEventSingleScreenTap:
			text = event.as_text()
			
