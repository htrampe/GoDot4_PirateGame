extends Node

var redDiamonds = 0
var goldCoins = 0

func debugShowValues():
	print("RED DIAMONDS: " + str(redDiamonds) + " Gold: " + str(goldCoins))


func addRedDiamonds():
	redDiamonds += 1
	debugShowValues()
	
func removeRedDiamonds():
	redDiamonds -= 1
	debugShowValues()
	
func addGoldCoin():
	goldCoins += 1
	debugShowValues()

func removeGoldCoin():
	goldCoins -= 1
	debugShowValues()
