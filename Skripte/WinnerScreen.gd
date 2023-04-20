extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$RedDiamondValue.text = str(Global.redDiamonds)
	$GoldCoinValue.text = str(Global.redDiamonds)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
