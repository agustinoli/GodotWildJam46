extends State

onready var enemy = self.get_node('../../')
export var Attack_speed_scale = 1.5
export var DAMAGE = 20
var my_pos
var player_pos


# Virtual function. Receives events from the `_unhandled_input()` callback.
func handle_input(_event: InputEvent) -> void:
	pass


# Virtual function. Corresponds to the `_process()` callback.
func update(_delta: float) -> void:
	pass


# Virtual function. Corresponds to the `_physics_process()` callback.
func physics_update(delta: float) -> void:
	player_pos = enemy.player.get_global_position()
	enemy.move_towards_target(delta,player_pos)
	enemy.get_animationSprite().play(enemy.get_current_dir() + "Attack")


# Virtual function. Called by the state machine upon changing the active state. The `msg` parameter
# is a dictionary with arbitrary data the state can use to initialize itself.
func enter(_msg := {}) -> void:
	print_debug("Entre a attack")
	enemy.NORMAL_SPEED *= Attack_speed_scale
	enemy.get_animationSprite().connect("animation_finished",self,'on_Animation_finished')


# Virtual function. Called by the state machine before changing the active state. Use this function
# to clean up the state.
func exit() -> void:
	enemy.NORMAL_SPEED /= Attack_speed_scale


func _on_AttackArea_area_entered(area):
	if area.get_name() == 'PlayerArea':
		state_machine.transition_to('Attack')


func _on_AttackArea_area_exited(area):
	if area.get_name() == 'PlayerArea':
		state_machine.transition_to('Chase')


func _on_AttackSurface_body_entered(body):
	if body.get_name() == 'Player' and enemy.get_timer().is_stopped():
		body.receive_hit(DAMAGE)
		enemy.get_timer().start()


func on_Animation_finished():
	enemy.get_animationSprite().disconnect("animation_finished",self,'on_Animation_finished')
