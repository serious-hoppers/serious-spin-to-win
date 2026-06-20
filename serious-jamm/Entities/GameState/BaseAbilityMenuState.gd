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


## @override
func on_fire(e: int):
	if e == 0:
		confirm()
	else:
		cancel()
		
		
func load_menu():
	pass	
	
	
func confirm():
	pass
	
	
func cancel():
	pass
