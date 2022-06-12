extends State


func physics_update(_delta: float) -> void:
	pass

func _on_AttackArea_area_exited(area):
	if area.get_name() == 'PlayerArea':
		state_machine.transition_to('Idle')
		print_debug('ENEMY: Paso a idle')
