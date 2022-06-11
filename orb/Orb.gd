extends Area2D

var MAX_POWER_LEVEL = 15
var VIBRATION_LEVEL = 0.3

var power_level
var atacking
var initial_position
var vibration_direction

func _ready():
	power_level = 0
	atacking = false
	initial_position = self.position
	vibration_direction = VIBRATION_LEVEL
	
	$Sprite.texture = load( str( "res://orb/orb_", power_level, ".png") )
	$Timer.wait_time = 0.1

func _process( delta ):
	# Vibracion del orbe en funcion del power_level
	# No me convence demasiado (randomizando quizas mejora?)
	position.x = initial_position.x + vibration_direction * power_level
	position.y = initial_position.y + vibration_direction * power_level / 2
	vibration_direction = vibration_direction * -1

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
		return true

func _on_Timer_timeout():
	if power_level > 0:
		power_level -= 1
		$Sprite.texture = load( str( "res://orb/orb_", power_level, ".png") )
	elif atacking and power_level == 0:
		atacking = false
