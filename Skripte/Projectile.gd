extends Node2D

var directionLeft = true
var pSpeed = 5
var damage = 1

var canMove = true
var range = 1000
var startX = 0

var lookLeft = true

var projectileTypes = Global.projectileTypes.CANNON

# Called when the node enters the scene tree for the first time.
func _ready():
	startX = self.position.x
	
	if(lookLeft == false):
		$AnimatedSprite2D.flip_h = true
		
	if(projectileTypes == 0):
		$AnimatedSprite2D.play("idle")
	else:
		$AnimatedSprite2D.play("idle_wood")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(canMove):
		if(directionLeft):
			self.position.x -= pSpeed
			if(startX - self.position.x > range):
				canMove = false
				explode()
		else:
			self.position.x += pSpeed
			if(self.position.x - startX > range):
				canMove = false
				explode()
			

func explode():
	if(projectileTypes == 0):
		$AnimatedSprite2D.play("explosion")
	else:
		$AnimatedSprite2D.play("explosion_wood")
	await get_tree().create_timer(0.3).timeout
	queue_free()


# HIT PLAYER
func _on_area_2d_body_entered(body):
	if(body.is_in_group("Player")):
		canMove = false
		Global.playerDamage(damage)
		explode()
