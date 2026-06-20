extends ActionState

@export var select_action_state: ActionState
@export var game_over_state: ActionState

var game_over: bool = false


func enter():
	super()
	await play_action()
	

func play_action():
	# Fire shot
	print("Firing shot")
	_owner.roulette.next()
	_owner.play_action_event.emit()
	
	# If shot, handle game over
	if _owner.roulette.is_bullet():
		shoot_bullet()
	else:
		shoot_blank()
			

func shoot_blank():
	_owner.state_machine.change_state(select_action_state)


func shoot_bullet():
	_owner.state_machine.change_state(game_over_state)