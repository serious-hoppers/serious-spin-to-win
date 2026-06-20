class_name BulletCountPanelController
extends Node

@export var stat_panel: StatPanel

var _owner: GameManager


func _ready() -> void:
	_owner = get_node("../")  # FIXME: Find a better reference than these relative paths
	
	_owner.play_action_event.connect(update_display)
	_owner.game_over_event.connect(game_over_display)
	_owner.restart_game_event.connect(update_display)


func _exit_tree() -> void:
	_owner.play_action_event.disconnect(update_display)
	_owner.game_over_event.disconnect(game_over_display)
	_owner.game_over_event.disconnect(update_display)
	

func update_display():
	stat_panel.display(_owner.roulette)
	
	
func game_over_display():
	stat_panel.game_over()