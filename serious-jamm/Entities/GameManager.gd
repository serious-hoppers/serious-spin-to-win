class_name GameManager
extends Node

signal game_over_event()
signal play_action_event()
signal restart_game_event()

@export var input_controller: InputController
@export var bullet_panel_controller: BulletCountPanelController

@export var roulette: RouletteManager

@export var state_machine: StateMachine
@export var start_state: State


func _ready() -> void:
	restart_game_event.emit()
	state_machine.change_state(start_state)
