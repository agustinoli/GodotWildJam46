extends Area2D

var direction

func _ready():
	visible = false
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
	$AnimatedSprite.play()
	$TimeToLive.start()

func _on_TimeToLive_timeout():
	visible = false
	self.set_process(true)

func set_direction( dir ):
	direction = dir

func _on_Flame_body_entered(body):
	if body.get_name() == 'Enemy':
		body.receive_hit()
