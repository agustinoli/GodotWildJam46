class_name Enemy
extends KinematicBody2D

var NORMAL_SPEED = 100
var MAX_HP = 100

var current_state
var speed
var velocity
var hp

func _ready():
	speed = NORMAL_SPEED
	velocity = Vector2.ZERO
	hp = MAX_HP

func _process(delta):
	
	current_state = $StateMachine.state.get_name()
	
	match current_state:
		'Idle':
			pass
			
		'Attack':
			move_towards_player( delta, $StateMachine.get_orb_area().get_global_position() )

func move_towards_player( delta, player_pos ):
	if position.x < player_pos.x:
		velocity.x = 1
	elif position.x > player_pos.x:
		velocity.x = -1
	else:
		velocity.x = 0
	
	if position.y < player_pos.y:
		velocity.y = 1.0 / 2
	elif position.y > player_pos.y:
		velocity.y = -1.0 / 2
	else:
		velocity.y = 0
	
	if velocity.x == 1:
		scale.x = scale.y * -1
	elif velocity.x == -1:
		scale.x = scale.y
	
	velocity = velocity.normalized() * speed
	
	move_and_collide( velocity * delta )

func receive_hit(damage_received):
	hp -= damage_received
	
	print_debug(str('ENEMY: Hited (HP=',hp,')'))
	
	if hp <= 0:
		queue_free()
