extends Node2D


@export var minWaitTime = 2
@export var maxWaitTime = 5
@export var lookLeft = true
@export var damageValue = 1
@export var pSpeed = 6
@export var range = 1000
@export var projectileType = Global.projectileTypes.CANNON
@export var showFireEffect = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("idle")
		
	if(lookLeft == false):
		$AnimatedSprite2D.flip_h = true
		$FireEffect.position.x *= -1
		$FireEffect.flip_h = true
	
	while(true):
		randomize()
		var waitTimer = randi_range(minWaitTime,maxWaitTime)
		await get_tree().create_timer(waitTimer).timeout
		fire()

		
func fire():
	
	if($CannonSound):
		$CannonSound.play()
		
	if($WoodProj):
		$WoodProj.play()
	
	$AnimatedSprite2D.play("fire")
	await get_tree().create_timer(0.2).timeout
	
	if(showFireEffect == true):
		$FireEffect.visible = true
		$FireEffect.play("fireeffect")
	
	spawnProjectile()
	await get_tree().create_timer(0.3).timeout
	$FireEffect.visible = false
	$AnimatedSprite2D.play("idle")
	
func spawnProjectile():
	var p = preload("res://Actors/Projectile.tscn").instantiate()
	
	p.pSpeed = pSpeed
	p.damage = damageValue
	p.range = range
	p.projectileTypes = projectileType
	p.lookLeft = lookLeft
	
	if(lookLeft == false):
		p.directionLeft = false
	
	p.position = self.position
	get_parent().add_child(p)
