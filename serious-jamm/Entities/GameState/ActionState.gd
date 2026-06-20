class_name ActionState
extends State

var _owner: GameManager

var action_menu_panel_controller: ActionMenuPanelController:
	get: return _owner.action_menu_panel_controller


func _ready() -> void:
	_owner = get_node("../../")
	
	
func add_listeners():
	_owner.input_controller.quit_event.connect(on_quit)
	_owner.input_controller.move_event.connect(on_move)
	_owner.input_controller.fire_event.connect(on_fire)
#	_owner.input_controller.quit_event.connect(on_quit)
#	_owner.input_controller.camera_zoom_event.connect(zoom)
#	_owner.input_controller.camera_rotate_event.connect(orbit)
	
	
func remove_listeners():
	_owner.input_controller.quit_event.disconnect(on_quit)
	_owner.input_controller.move_event.disconnect(on_move)
	_owner.input_controller.fire_event.disconnect(on_fire)
#	_owner.input_controller.quit_event.disconnect(on_quit)
#	_owner.input_controller.camera_zoom_event.disconnect(zoom)
#	_owner.input_controller.camera_rotate_event.disconnect(orbit)
	
	
func on_quit():
	get_tree().quit()
	
	
func on_move(e: Vector2i):
	pass
	

func on_fire(e: int):
	pass
