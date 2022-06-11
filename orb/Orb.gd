extends Area2D

var MAX_POWER_LEVEL = 15

var power_level

func _ready():
	power_level = 0
	
	$Sprite.texture = load( str( "res://orb_", power_level, ".png") )
	$Timer.wait_time = 0.1

func use():
	if power_level < MAX_POWER_LEVEL:
		power_level += 1
		$Sprite.texture = load( str( "res://orb_", power_level, ".png") )
		$Timer.start()

func _on_Timer_timeout():
	if power_level > 0:
		power_level -= 1
		$Sprite.texture = load( str( "res://orb_", power_level, ".png") )
