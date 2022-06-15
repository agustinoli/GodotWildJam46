extends State

onready var enemy = self.get_node('../../')

func physics_update(delta: float) -> void:
	enemy.move_towards_player(delta, enemy.get_animationSprite().get_orb_area().get_global_position())
	
	
# Upon entering the state, we set the Player node's velocity to zero.
func enter(_msg := {}) -> void:
	pass


func _on_AttackArea_area_exited(area):
	if area.get_name() == 'PlayerArea':
		state_machine.transition_to('Idle')
		print_debug('ENEMY: Paso a idle')
