class_name Orb
extends Area2D

func _ready():
	pass

func _process( _delta ):
	pass

func _on_BlueOrb_body_entered(body):
	picked(body)

func _on_GreenOrb_body_entered(body):
	picked(body)

func _on_RedOrb_body_entered(body):
	picked(body)

func picked(body):
	if body.get_name() == 'Player':
		print_debug(str('Player has picked a ', self.get_name() ) )
		body.orb_picked(self.get_name())
		queue_free()


