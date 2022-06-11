extends State


func physics_update(delta: float) -> void:
	pass

func _on_AttackArea_area_exited(area):
	if area.get_name() == 'Orb':
		state_machine.transition_to('Idle')
		print_debug('ZOMBIE: Paso a idle')
