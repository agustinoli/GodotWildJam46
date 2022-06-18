class_name Enemy
extends KinematicBody2D

export var NORMAL_SPEED = 100
export var MAX_HP = 100
export(String, FILE, "*.tres") var sprite_frames_file

var current_state
var speed
var velocity

var player

var hp = MAX_HP

var directions = ["Right", "RightDown", "Down", "LeftDown", "Left", "LeftUp", "Up", "RightUp"]
var current_direction: String = "Down" setget set_current_dir, get_current_dir

onready var navigator: Navigation2D = self.get_node('../../')


func set_current_dir(new_dir: String):
	current_direction = new_dir


func get_current_dir() -> String:
	return current_direction


func get_dir(index: int) -> String:
	return directions[index]


func get_animationSprite () -> Node:
	return $AnimatedSprite


func _ready():
	speed = NORMAL_SPEED
	velocity = Vector2.ZERO
	var sprite_frames: SpriteFrames = load(sprite_frames_file)
	$AnimatedSprite.set_sprite_frames(sprite_frames)


func _process(_delta):
	pass


func move_towards_target( delta, target_pos ):
	if position.x < target_pos.x:
		velocity.x = 1
	elif position.x > target_pos.x:
		velocity.x = -1
	else:
		velocity.x = 0
	
	if position.y < target_pos.y:
		velocity.y = 1.0 / 2
	elif position.y > target_pos.y:
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
		$StateMachine.transition_to("Die")


var path = []


func move_along_path(distance):
	var last_point = self.position
	while path.size():
		var distance_between_points = last_point.distance_to(path[0])
		# The position to move to falls between two points.
		if distance <= distance_between_points:
			self.position = last_point.linear_interpolate(path[0], distance / distance_between_points)
			return
		# The position is past the end of the segment.
		distance -= distance_between_points
		last_point = path[0]
		path.remove(0)
	# The character reached the end of the path.
	self.position = last_point
#	set_process(false)


func _update_navigation_path(start_position, end_position):
	# get_simple_path is part of the Navigation2D class.
	# It returns a PoolVector2Array of points that lead you
	# from the start_position to the end_position.
	path = navigator.get_simple_path(start_position, end_position, true)
	# The first point is always the start_position.
	set_process(true)
