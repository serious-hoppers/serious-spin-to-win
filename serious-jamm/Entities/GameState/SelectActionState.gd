extends BaseAbilityMenuState

@export var perform_action_state: State

var game_over: bool = false


## @override
func enter():
	super()


## @override
func exit():
	super()
	

func add_listeners():
	_owner.input_controller.fire_event.connect(on_fire)
	
	
func remove_listeners():
	_owner.input_controller.quit_event.disconnect(on_fire)
	
	
func on_fire(e: int):
	print("Firing shot")
	_owner.state_machine.change_state(perform_action_state)
