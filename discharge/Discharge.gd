extends Area2D

var NORMAL_SPEED = 500
var DAMAGE = 25

var direction
var speed
var velocity
var audioPlayer
onready var dischargeAudio : AudioStreamSample = ResourceLoader.load("res://discharge/discharge.wav")
onready var hittedAudio : AudioStreamSample = ResourceLoader.load("res://discharge/hitted.wav")

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
	audioPlayer.set_stream(dischargeAudio)
	audioPlayer.play()
	position = init_pos
	direction = init_dir
	$TimeToLive.start()

func set_audio_player (ap):
	self.audioPlayer = ap

func _on_TimeToLive_timeout():
	queue_free()

func _on_Discharge_body_entered(body):
	if body is Enemy or body is Rock:
		print_debug('DISCHARGE: Body hited')
		audioPlayer.set_stream(hittedAudio)
		audioPlayer.play()
		body.receive_hit(DAMAGE)
		queue_free()
