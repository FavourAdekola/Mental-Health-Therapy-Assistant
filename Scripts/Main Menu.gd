extends Control

@onready var welcome_panel = $"Welcome Panel"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	welcome_panel.visible = false


func _on_sprite_2d_pressed():
	get_tree().change_scene_to_file("res://Mental-Health-Therapy-Assistant/Scenes/fishing_game.tscn")
