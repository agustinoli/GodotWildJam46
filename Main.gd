extends Node

var discharge_scene = load( "res://discharge/Discharge.tscn" )

func _ready():
	pass

func _process( _delta ):
	if Input.is_action_just_pressed( "exit" ):
		get_tree().quit()
	
	if $Enemy != null and $Player != null:
		$Enemy.set_player_position( $Player.get_position() )

func _on_Player_discharge():
	var discharge_node = discharge_scene.instance()
	discharge_node.init( $Player.get_position(), $Player.get_direction() )
	discharge_node.connect( "enemy_hited", self, "enemy_hited" )
	add_child( discharge_node )

func enemy_hited():
	print_debug( 'MAIN: Enemy golpeado' )
	$Enemy.queue_free()
