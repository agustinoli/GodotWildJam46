extends State

# Upon entering the state, we set the Player node's velocity to zero.
func enter(_msg := {}) -> void:
	pass

func update(delta: float) -> void:
	pass

func _on_AttackArea_area_entered(area):
	state_machine.transition_to('Attack')
	print_debug('ZOMBIE: Paso a attack')
