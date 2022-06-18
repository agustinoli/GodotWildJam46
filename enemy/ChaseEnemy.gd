extends State

onready var enemy = self.get_node('../../')
var my_pos
var player_pos

func physics_update(delta: float) -> void:
	player_pos = enemy.player.get_global_position()
	enemy.move_towards_target(delta,player_pos)
#	enemy.move_along_path(enemy.NORMAL_SPEED * delta)
	enemy.get_animationSprite().play(enemy.get_current_dir() + "Run")
	
func update(_delta: float) -> void:
	pass
	
# Upon entering the state, we set the Player node's velocity to zero.
func enter(_msg := {}) -> void:
	player_pos = enemy.player.get_global_position()
	enemy._update_navigation_path(enemy.get_global_position(),player_pos)
	print_debug(enemy.get_global_position(),player_pos)
	


func _on_AttackArea_area_exited(area):
	if area.get_name() == 'PlayerArea':
		enemy.player = null # ya no se donde esta el player
		state_machine.transition_to('Idle')
