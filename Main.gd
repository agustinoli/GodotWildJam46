extends Node

var discharge_scene = load( "res://discharge/Discharge.tscn" )

func _ready():
	pass

func _process( _delta ):
	if Input.is_action_just_pressed( "exit" ):
		get_tree().quit()
	
	if $Zombie != null:
		$Zombie.set_player_position( $Player.get_position() )

func _on_Player_discharge():
	var discharge_node = discharge_scene.instance()
	discharge_node.init( $Player.get_position(), $Player.get_direction() )
	discharge_node.connect( "zombie_hited", self, "zombie_hited" )
	add_child( discharge_node )

func zombie_hited():
	print_debug( 'MAIN: Zombie golpeado' )
	$Zombie.queue_free()
