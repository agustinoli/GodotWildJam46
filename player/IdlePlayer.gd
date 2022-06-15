extends State

onready var player = self.get_node('../../')
onready var animationSprite = self.get_node('../../AnimatedSprite')
var facing


# Virtual function. Receives events from the `_unhandled_input()` callback.
func handle_input(_event: InputEvent) -> void:
	pass


# Virtual function. Corresponds to the `_process()` callback.
func update(_delta: float) -> void:
	if Input.is_action_pressed("move_left") or Input.is_action_pressed("move_up") or Input.is_action_pressed("move_right") or Input.is_action_pressed("move_down"):
		state_machine.transition_to("Run")
	if player.has_blue_orb and Input.is_action_just_pressed( "use_blue_orb" ):
		state_machine.transition_to("Attack")
	if player.has_green_orb and Input.is_action_just_pressed( "use_green_orb" ):
		pass
	if player.has_red_orb and Input.is_action_just_pressed( "use_red_orb" ):
		pass


# Virtual function. Corresponds to the `_physics_process()` callback.
func physics_update(_delta: float) -> void:
	pass


# Virtual function. Called by the state machine upon changing the active state. The `msg` parameter
# is a dictionary with arbitrary data the state can use to initialize itself.
func enter(_msg := {}) -> void:
#	facing = player.get_facing()
	animationSprite.play(player.get_current_dir() + "Idle" )


# Virtual function. Called by the state machine before changing the active state. Use this function
# to clean up the state.
func exit() -> void:
	pass
