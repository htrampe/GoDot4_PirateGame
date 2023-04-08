extends Node2D

@export
var hp = 5

func checkDestroy():
	hp -= 1
	if(hp <= 0):
		$AnimatedSprite2D.play("destroyed")
		$GPUParticles2D.emitting = true
		await get_tree().create_timer(0.1).timeout
		$AnimatedSprite2D.visible = false
		await get_tree().create_timer(0.3).timeout
		spawnRandomItem(self.position)
		queue_free()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawnRandomItem(targetLocation):
	var newItem = null
	
	randomize()
	var randomItemSpawner = randi_range(0,2)
	match(randomItemSpawner):
		1: newItem = preload("res://Actors/GoldCoin.tscn")
		2: newItem = preload("res://Actors/RedDiamond.tscn")
		
	if(newItem != null):
		var newItemInstance = newItem.instantiate()
		newItemInstance.position = targetLocation
		get_parent().add_child(newItemInstance)


func _on_area_2d_area_entered(area):
	if(area.is_in_group("FromPlayer")):
		$AnimatedSprite2D.play("hit")
		checkDestroy()
