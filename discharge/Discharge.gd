extends Area2D

signal zombie_hited

var NORMAL_SPEED = 500

var direction
var speed
var velocity

func _ready():
	$TimeToLive.wait_time = 1
	speed = NORMAL_SPEED
	velocity = Vector2.ZERO

func _process( delta ):
	if visible:
		position.x = position.x + speed * delta * direction

func init( init_pos, init_dir ):
	print_debug( 'DISCHARGE: Init')
	position = init_pos
	direction = init_dir
	$TimeToLive.start()

func _on_TimeToLive_timeout():
	queue_free()

func _on_Discharge_body_entered(body):
	if body.get_name() == 'Zombie':
		emit_signal( 'zombie_hited' )
		queue_free()
