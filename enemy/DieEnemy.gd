# Virtual base class for all states.
extends State


onready var enemy = self.get_node('../../')
export var DieAnimationSpeed = 0.7
# Virtual function. Receives events from the `_unhandled_input()` callback.
func handle_input(_event: InputEvent) -> void:
	pass


# Virtual function. Called by the state machine upon changing the active state. The `msg` parameter
# is a dictionary with arbitrary data the state can use to initialize itself.
func enter(_msg := {}) -> void:
	enemy.get_animationSprite().set_speed_scale(DieAnimationSpeed)
	enemy.get_animationSprite().play(enemy.get_current_dir() + "Die" )
	enemy.get_animationSprite().connect("animation_finished",self,'on_Animation_finished')


func on_Animation_finished():
	enemy.queue_free()
