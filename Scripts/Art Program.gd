extends Control

@onready var wheel = $Panel/ColorPicker
@onready var button = $Panel/Button
@onready var canvas = $Panel/Canvas



var button_state = "showing"






	
func _process(delta):
	canvas.line_color = wheel.color
	pass

func _on_button_pressed():
	
	if button_state == "showing":
		$Panel/Button/Hide.visible = false
		$Panel/Button/Show.visible = true
		wheel.visible = false
		button_state = "hidden"
	else:
		$Panel/Button/Hide.visible = true
		$Panel/Button/Show.visible = false
		wheel.visible = true
		button_state = "showing"
