class_name Enemy
extends KinematicBody2D

var NORMAL_SPEED = 100
var MAX_HP = 100

var current_state
var speed
var velocity

var player
var hp = MAX_HP

var directions = ["Right", "RightDown", "Down", "LeftDown", "Left", "LeftUp", "Up", "RightUp"]
var current_direction: String = "Down" setget set_current_dir, get_current_dir
var facing = Vector2() setget set_facing, get_facing


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


func get_animationSprite () -> Node:
	return $AnimatedSprite


func _ready():
	speed = NORMAL_SPEED
	velocity = Vector2.ZERO

func _process(_delta):
	pass

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
	self.set_current_dir(direction2str(velocity))
# warning-ignore:return_value_discarded
	move_and_collide( velocity * delta )


func direction2str(direction):
	var angle = direction.angle()
	if angle < 0:
		angle += 2 * PI
	var index = round(angle / PI * 4)
	return self.get_dir(index)

func receive_hit(damage_received):
	hp -= damage_received
	
	print_debug(str('ENEMY: Hited (HP=',hp,')'))
	
	if hp <= 0:
		queue_free()

