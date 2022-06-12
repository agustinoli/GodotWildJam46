extends Node

var discharge_scene = load( "res://discharge/Discharge.tscn" )

func _ready():
	pass

func _process( _delta ):
	if Input.is_action_just_pressed( "exit" ):
		get_tree().quit()

func _on_Player_discharge():
	var discharge_node = discharge_scene.instance()
	add_child( discharge_node )
	discharge_node.init( $Player.get_position(), $Player.get_direction() )
	discharge_node.connect( "enemy_hited", self, "enemy_hited" )

func enemy_hited():
	print_debug( 'MAIN: Enemy golpeado' )
	$Enemy.queue_free()
