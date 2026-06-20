class_name BaseAbilityMenuState
extends ActionState

var menu_title: String
var menu_options: Array[String] = []


## @override
func enter():
	super()
	await load_menu()
	
	
## @override
func exit():
	super()
	await action_menu_panel_controller.hide()


## @override
func on_fire(e: int):
	if e == 0:
		confirm()
	else:
		cancel()
		
		
func on_move(e: Vector2i):
	if e.x > 0 or e.y > 0:
		action_menu_panel_controller.next()
	else:
		action_menu_panel_controller.previous()
		
		
func load_menu():
	pass	
	
	
func confirm():
	pass
	
	
func cancel():
	pass
