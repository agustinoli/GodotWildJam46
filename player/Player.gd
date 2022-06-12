extends KinematicBody2D

signal discharge

var NORMAL_SPEED = 400

var speed
var velocity
var direction
var has_blue_orb
var has_green_orb
var has_red_orb

func _ready():
	speed = NORMAL_SPEED
	velocity = Vector2.ZERO
	direction = -1
	has_blue_orb = false
	has_green_orb = false
	has_red_orb = false
	$SprintTimer.wait_time = 1

func _physics_process( delta ):
	var collisioned_body
	
	parse_input()
	collisioned_body = move_and_collide( delta * velocity )
	
	if collisioned_body != null:
		if collisioned_body.collider.get_name() == 'Enemy':
			print_debug( 'PLAYER: Player hited' )
			queue_free()

func parse_input():
	velocity = Vector2.ZERO
	
	velocity.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	velocity.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	velocity.y /= 2
	velocity = velocity.normalized() * speed
	
	if has_blue_orb and Input.is_action_just_pressed( "use_blue_orb" ):
		emit_signal("discharge")
	if has_green_orb and Input.is_action_just_pressed( "use_green_orb" ):
		speed = NORMAL_SPEED * 2
		$SprintTimer.start()
	if has_red_orb and Input.is_action_just_pressed( "use_red_orb" ):
		pass
	
	if velocity.x > 0:
		scale.x = scale.y * -1
		direction = 1
	elif velocity.x < 0:
		scale.x = scale.y
		direction = -1
	
	velocity = velocity.normalized() * speed

func orb_picked( orb_type ):
	match orb_type:
		'BlueOrb':
			has_blue_orb = true
		'RedOrb':
			has_red_orb = true
		'GreenOrb':
			has_green_orb = true

func get_direction():
	return direction

func _on_SprintTimer_timeout():
	speed = NORMAL_SPEED
