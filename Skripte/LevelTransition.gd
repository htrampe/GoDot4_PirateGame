extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

@export
var targetLevel = ""

@export
var neededGold = 0

func _on_area_2d_body_entered(body):
	if(body.is_in_group("Player") and Global.goldCoins >= neededGold):
		get_tree().change_scene_to_file("res://Levels/" + targetLevel + ".tscn")
