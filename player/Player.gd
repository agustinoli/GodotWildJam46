extends KinematicBody2D

signal discharge

var NORMAL_SPEED = 400

var speed
var velocity
var direction

func _ready():
	speed = NORMAL_SPEED
	velocity = Vector2.ZERO
	direction = 1

func _physics_process( delta ):
	var collisioned_body
	
	parse_input()
	collisioned_body = move_and_collide( delta * velocity )
	
	if collisioned_body != null:
		print_debug( str( 'PLAYER: Colision con ', collisioned_body.collider.get_name() ) )

func parse_input():
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed( "move_up" ):
		velocity.y = -1
	elif Input.is_action_pressed( "move_down" ):
		velocity.y = 1
	
	if Input.is_action_pressed( "move_right" ):
		velocity.x = 1
	elif Input.is_action_pressed( "move_left" ):
		velocity.x = -1
	
	if Input.is_action_pressed( "use_orb" ):
		use_orb()
	
	if velocity.x == 1:
		scale.x = scale.y * -1
		direction = 1
	elif velocity.x == -1:
		scale.x = scale.y
		direction = -1
	
	velocity = velocity.normalized() * speed

func use_orb():
	if $Orb.use():
		emit_signal( 'discharge' )

func get_direction():
	return direction
