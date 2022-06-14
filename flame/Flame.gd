extends Area2D

var DAMAGE = 60

var direction

func _ready():
	visible = false
	$CollisionShape2D.disabled = true
	$TimeToLive.wait_time = 3

func _process( delta ):
	if visible:
		match direction:
			'Right':
				position = Vector2(50, 0)
				rotation = deg2rad(90)
			'Left':
				position = Vector2(-50, 0)
				rotation = deg2rad(-90)
			'Up':
				position = Vector2(0, -50)
				rotation = deg2rad(0)
			'Down':
				position = Vector2(0, 50)
				rotation = deg2rad(180)
			'RightUp':
				position = Vector2(25, -25)
				rotation = deg2rad(45)
			'RightDown':
				position = Vector2(25, 25)
				rotation = deg2rad(135)
			'LeftUp':
				position = Vector2(-25, -25)
				rotation = deg2rad(-45)
			'LeftDown':
				position = Vector2(-25, 25)
				rotation = deg2rad(-135)

func cast():
	print_debug( 'FLAME: Cast')
	self.set_process(true)
	visible = true
	$CollisionShape2D.disabled = false
	$AnimatedSprite.play()
	$TimeToLive.start()

func _on_TimeToLive_timeout():
	visible = false
	$CollisionShape2D.disabled = true
	self.set_process(true)

func set_direction( dir ):
	direction = dir

func _on_Flame_body_entered(body):
	if body.get_name() == 'Enemy':
		print_debug('FLAME: Enemy hited')
		body.receive_hit(DAMAGE)
