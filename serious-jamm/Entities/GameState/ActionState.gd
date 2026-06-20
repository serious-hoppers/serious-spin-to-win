class_name ActionState
extends State

var _owner: GameManager

func _ready() -> void:
	_owner = get_node("../../")
	
	
func add_listeners():
	_owner.input_controller.quit_event.connect(on_quit)
	
	
func remove_listeners():
	_owner.input_controller.quit_event.disconnect(on_quit)
	
	
func on_quit():
	get_tree().quit()