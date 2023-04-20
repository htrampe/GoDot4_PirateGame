extends Node

var redDiamonds = 2
var goldCoins = 0

enum projectileTypes {CANNON, TOTEM}

signal playerHit

func playerDamage(value):
	redDiamonds -= 1
	if(redDiamonds <= 0):
		get_tree().change_scene_to_file("res://Levels/DeadLevel.tscn")
	else:
		playerHit.emit()


func debugShowValues():
	print("RED DIAMONDS: " + str(redDiamonds) + " Gold: " + str(goldCoins))

func addRedDiamonds():
	redDiamonds += 1
	
	
func removeRedDiamonds():
	redDiamonds -= 1
	
	
func addGoldCoin():
	goldCoins += 1
	

func removeGoldCoin():
	goldCoins -= 1
	
