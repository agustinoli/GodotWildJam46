extends State

var orb_area

# Upon entering the state, we set the Player node's velocity to zero.
func enter(_msg := {}) -> void:
	pass

func update(_delta: float) -> void:
	pass

func _on_AttackArea_area_entered(area):
	if area.get_name() == 'Orb':
		orb_area = area
		state_machine.transition_to('Attack')
		print_debug('ENEMY: Paso a attack')

func get_orb_area():
	return orb_area
