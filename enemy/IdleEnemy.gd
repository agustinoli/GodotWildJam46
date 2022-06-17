extends State

onready var enemy = self.get_node('../../')
var facing

func enter(_msg := {}) -> void:
	print_debug("Enemy entro a Idle")
	enemy.get_animationSprite().play(enemy.get_current_dir() + "Idle" )
	

func update(_delta: float) -> void:
	pass

func _on_AttackArea_area_entered(area):
	if area.get_name() == 'PlayerArea':
		enemy.player = area
		state_machine.transition_to('Chase')
		print_debug('ENEMY: Paso a chase')
