extends State

onready var enemy = self.get_node('../../')
var my_pos
var player_pos

func physics_update(delta: float) -> void:
	player_pos = enemy.player.get_global_position()
	enemy.move_towards_player(delta,player_pos)
	enemy.get_animationSprite().play(enemy.get_current_dir() + "Run")
	
	
	
# Upon entering the state, we set the Player node's velocity to zero.
func enter(_msg := {}) -> void:
	print_debug("Enemy entro a Chase")
	enemy.get_animationSprite().play(enemy.get_current_dir() + "Run")
	


func _on_AttackArea_area_exited(area):
	if area.get_name() == 'PlayerArea':
		enemy.player = null # ya no se donde esta el player
		state_machine.transition_to('Idle')
		print_debug('ENEMY: Paso a idle')
