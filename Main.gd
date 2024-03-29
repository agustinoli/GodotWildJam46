extends Node

var discharge_scene = load( "res://discharge/Discharge.tscn" )
onready var player = $Navigation2D/YSort/Player

func _ready():
	pass

func _process( _delta ):
	if Input.is_action_just_pressed( "exit" ):
		get_tree().quit()

func _on_Player_discharge():
	var discharge_node = discharge_scene.instance()
	add_child( discharge_node )
	discharge_node.set_audio_player($Audio)
	discharge_node.init( player.get_position(), player.get_current_dir())

func _on_Player_orb_selected(orb_type):
	$HUD.set_current_orb(orb_type)

func _on_Player_orb_picked(orb_type):
	$HUD.set_orb_picked(orb_type)


func _on_Area2D_area_entered(area):
	if area.get_name() == 'PlayerArea':
		Game.emit_signal("ChangeScene","res://outros/GameWon.tscn")
