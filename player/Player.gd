extends KinematicBody2D

signal discharge

signal orb_selected
signal orb_picked

var directions = ["Right", "RightDown", "Down", "LeftDown", "Left", "LeftUp", "Up", "RightUp"]
var current_direction: String = "Down" setget set_current_dir, get_current_dir
var facing = Vector2() setget set_facing, get_facing

var orb_selected

var has_blue_orb
var has_green_orb
var has_red_orb

func set_current_dir(new_dir: String):
	current_direction = new_dir


func get_current_dir() -> String:
	return current_direction


func get_dir(index: int) -> String:
	return directions[index]


func set_facing(new_facing: Vector2):
	facing = new_facing


func get_facing() -> Vector2:
	return facing

func _ready():
	has_blue_orb = false
	has_green_orb = false
	has_red_orb = false
	orb_selected = ''
	$SprintTimer.wait_time = 1

func _process(_delta):
	$Flame.set_direction(current_direction)

func parse_input():
	if has_blue_orb and Input.is_action_just_pressed( "choose_blue_orb" ):
		orb_selected = 'BlueOrb'
		emit_signal("orb_selected","BLUE")
	if has_green_orb and Input.is_action_just_pressed( "choose_green_orb" ):
		orb_selected = 'GreenOrb'
		emit_signal("orb_selected","GREEN")
	if has_red_orb and Input.is_action_just_pressed( "choose_red_orb" ):
		orb_selected = 'RedOrb'
		emit_signal("orb_selected","RED")
	if Input.is_action_just_pressed("use_orb"):
		$StateMachine.transition_to('Attack')

func orb_picked( orb_type ):
	match orb_type:
		'BlueOrb':
			has_blue_orb = true
			emit_signal("orb_picked","BLUE")
		'RedOrb':
			has_red_orb = true
			emit_signal("orb_picked","RED")
		'GreenOrb':
			has_green_orb = true
			emit_signal("orb_picked","GREEN")

func use_orb():
	match orb_selected:
		'BlueOrb':
			emit_signal("discharge")
		'GreenOrb':
			pass
		'RedOrb':
			$Flame.cast()

func _on_SprintTimer_timeout():
	pass
