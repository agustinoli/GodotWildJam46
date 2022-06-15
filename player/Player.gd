extends KinematicBody2D

signal discharge

var directions = ["Right", "RightDown", "Down", "LeftDown", "Left", "LeftUp", "Up", "RightUp"]
var current_direction: String = "Down" setget set_current_dir, get_current_dir
var facing = Vector2() setget set_facing, get_facing

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
	$SprintTimer.wait_time = 1

func _process(_delta):
	parse_input()

func parse_input():
	pass

func orb_picked( orb_type ):
	match orb_type:
		'BlueOrb':
			has_blue_orb = true
		'RedOrb':
			has_red_orb = true
		'GreenOrb':
			has_green_orb = true
