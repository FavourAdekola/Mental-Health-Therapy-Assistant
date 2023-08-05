extends Node2D

@onready var marker = $CharacterBody2D

var tier = 1
var range = 128
var stopped = true
var marker_direction = 1
var speed = 4
var mass = 1000

func _physics_process(delta):
	if !stopped:
		marker.position.x = marker.position.x + 4* marker_direction
		if range <= abs(marker.position.x):
			marker_direction *= -1 
	



func _on_tier_1_body_entered(body):
	tier = 1


func _on_tier_2_body_entered(body):
	tier = 2


func _on_tier_3_body_entered(body):
	tier = 3


func _on_tier_4_body_entered(body):
	tier = 4


func _on_tier_5_body_entered(body):
	tier = 5
