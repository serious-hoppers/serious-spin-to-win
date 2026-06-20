extends BaseAbilityMenuState

@export var perform_action_state: State


## @override
func enter():
	super()


## @override
func exit():
	super()
	

func load_menu():
	if menu_options.size() == 0:
		menu_title = "Actions"
		menu_options.append("Fire")
		
	action_menu_panel_controller.show(menu_title, menu_options)
#	action_menu_panel_controller.set_locked(0, has_money)
	
	
func confirm():
	match action_menu_panel_controller.selection:
		0: _owner.state_machine.change_state(perform_action_state)  # We should provide arg to preface which action


func cancel():
	pass
	