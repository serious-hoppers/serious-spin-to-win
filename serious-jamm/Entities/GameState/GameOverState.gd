extends ActionState

@export var select_action_state: ActionState


func enter():
	super()
	_owner.game_over_event.emit()


func add_listeners():
	_owner.input_controller.fire_event.connect(on_fire)
	
	
func remove_listeners():
	_owner.input_controller.fire_event.disconnect(on_fire)


func on_fire(e: int):
	on_game_reset()
		
		
func on_game_reset():
	# Reset the roulette and update the stats
	_owner.roulette.reset()
	_owner.restart_game_event.emit()
	
	# Restart the game
	_owner.state_machine.change_state(select_action_state)
