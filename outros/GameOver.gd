extends Node

onready var GameOverAudio : AudioStreamSample = ResourceLoader.load("res://outros/GameOver.wav")

# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer.connect("finished",self,"on_Audio_finished")
	$Camera2D._set_current(true)
	$AudioStreamPlayer.set_stream(GameOverAudio)
	$AudioStreamPlayer.play()

func on_Audio_finished():
	Game.emit_signal("Exit")
