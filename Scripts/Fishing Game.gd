extends Node2D

@onready var anim = $AnimationPlayer
@onready var minigame = $"Game Holder/Minigame"
@onready var fish_result = $"Fish Result"
@onready var fish_size_display = $"Fish Result/Background/Label"
@onready var high_score_display = $HighScore
@onready var fish_display = $"Fish Result/Background/FishDisplay"

@onready var fish_sprites = [preload("res://Mental-Health-Therapy-Assistant/Sprites/tier_one_fish.png"), preload("res://Mental-Health-Therapy-Assistant/Sprites/tier_two_fish.png"), preload("res://Mental-Health-Therapy-Assistant/Sprites/tier_three_fish.png"), preload("res://Mental-Health-Therapy-Assistant/Sprites/tier_four_fish.png"), preload("res://Mental-Health-Therapy-Assistant/Sprites/tier_five_fish.png")]

var game_state = "Start"
var can_interact = true
var rng = RandomNumberGenerator.new()
var high_score = 0

var fish_size = 0


func _ready():
	anim.play("Start")
	pass
	
func _physics_process(delta):
	if Input.is_action_just_pressed("Interact") and can_interact:
		print(game_state)
		match game_state:
			"Start":
				game_state = "Cast"
			"Cast":
				game_state = "Fish"
			"Fish":
				game_state = "Cast"
		print(game_state)
	
	match game_state:
		"Cast":
			cast()
		"Fish":
			fish()
	if game_state == "Fish":
		game_state = "Start"
	
	
	high_score_display.text = str(high_score)

func cast():
	minigame.stopped = false
	anim.play("Cast")

func fish():
	anim.play("Catch")
	minigame.stopped = true
	
	var mass_index
	
	match minigame.tier:
		1:
			mass_index = rng.randf_range(0.8,1)
		2:
			mass_index = rng.randf_range(0.6,0.85)
		3:
			mass_index = rng.randf_range(0.4,0.65)
		4:
			mass_index = rng.randf_range(0.2,0.45)
		5:
			mass_index = rng.randf_range(0.01,0.25)
			
	if fish_size == 0:
		fish_size = mass_index * minigame.mass
		
		if fish_size > high_score:
			high_score = round(fish_size)
	
	fish_display.texture = fish_sprites[rng.randi_range(0,4)]
	
	fish_result.visible = true
	can_interact = false
	
	fish_size_display.text = str(round(fish_size))
	
	await get_tree().create_timer(2.5).timeout
	
	can_interact = true
	fish_result.visible = false
	fish_size = 0
	
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Mental-Health-Therapy-Assistant/Scenes/Main Menu.tscn")
