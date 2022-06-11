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
		if collisioned_body.collider.get_name() == 'Enemy':
			print_debug( 'PLAYER: Player hited' )
			queue_free()
		

func parse_input():
	velocity = Vector2.ZERO
	
	velocity.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	velocity.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	velocity.y /= 2
	velocity = velocity.normalized() * speed
	
	if Input.is_action_pressed( "use_orb" ):
		use_orb()
	
	if velocity.x > 0:
		scale.x = scale.y * -1
		direction = 1
	elif velocity.x < 0:
		scale.x = scale.y
		direction = -1
	
	velocity = velocity.normalized() * speed

func use_orb():
	if $Orb.use():
		emit_signal( 'discharge' )

func get_direction():
	return direction
