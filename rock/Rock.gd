class_name Rock
extends StaticBody2D

func _ready():
	pass

func receive_hit(_damage):
	queue_free()
