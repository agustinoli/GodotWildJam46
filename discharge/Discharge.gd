extends Area2D

signal enemy_hited

var NORMAL_SPEED = 500

var direction
var speed
var velocity

func _ready():
	$TimeToLive.wait_time = 3
	speed = NORMAL_SPEED
	velocity = Vector2.ZERO

func _process( delta ):
	if visible:
		match direction:
			'Right':
				position.x = position.x + speed * delta
			'Left':
				position.x = position.x + speed * delta * -1
			'Up':
				position.y = position.y + speed * delta * -1
			'Down':
				position.y = position.y + speed * delta
			'RightUp':
				position.x = position.x + speed * delta
				position.y = position.y + speed / 2 * delta * -1
			'RightDown':
				position.x = position.x + speed * delta
				position.y = position.y + speed / 2 * delta
			'LeftUp':
				position.x = position.x + speed * delta * -1
				position.y = position.y + speed / 2 * delta * -1
			'LeftDown':
				position.x = position.x + speed * delta * -1
				position.y = position.y + speed / 2 * delta

func init( init_pos, init_dir ):
	print_debug( 'DISCHARGE: Init')
	position = init_pos
	direction = init_dir
	$TimeToLive.start()

func _on_TimeToLive_timeout():
	queue_free()

func _on_Discharge_body_entered(body):
	if body.get_name() == 'Enemy':
		emit_signal( 'enemy_hited' )
		queue_free()
