extends Node

func _ready():
	pass

func _process( _delta ):
	if Input.is_action_just_pressed( "exit" ):
		get_tree().quit()
	
	$Zombie.set_player_position( $Player.get_position() )
