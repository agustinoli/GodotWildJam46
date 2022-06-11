extends Area2D

var MAX_POWER_LEVEL = 15

var power_level
var atacking

func _ready():
	power_level = 0
	atacking = false
	
	$Sprite.texture = load( str( "res://orb/orb_", power_level, ".png") )
	$Timer.wait_time = 0.1
	$AtackTimer.wait_time = 2

func use():
	if atacking:
		return false
	
	if power_level < MAX_POWER_LEVEL:
		power_level += 1
		$Sprite.texture = load( str( "res://orb/orb_", power_level, ".png") )
		$Timer.start()
		return false
	else:
		atacking = true
		$AtackTimer.start()
		return true

func _on_Timer_timeout():
	if power_level > 0:
		power_level -= 1
		$Sprite.texture = load( str( "res://orb/orb_", power_level, ".png") )

func _on_AtackTimer_timeout():
	atacking = false
