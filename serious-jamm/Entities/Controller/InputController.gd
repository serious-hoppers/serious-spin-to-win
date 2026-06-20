class_name InputController
extends Node

signal move_event(point: Vector2i)

signal fire_event(button: int)
signal quit_event()

var buttons = ["fire_1", "fire_2"]


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("quit"):
		quit_event.emit()
		
	if Input.is_action_just_pressed("fire_1"):
		fire_event.emit(1)
		
	
