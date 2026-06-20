class_name ActionMenuEntry
extends Node

enum States
{
	NONE = 0,
	SELECTED = 1 << 0,
	LOCKED = 1 << 1
}

@export var bullet: TextureRect
@export var label: Label
@export var normal_sprite: Texture2D
@export var selected_sprite: Texture2D
@export var disabled_sprite: Texture2D

var _state: States
var state: States:
	get:
		return _state
	set(value):
		_state = value
		
		var font_color: String = "theme_override_colors/font_color"
		var font_outline_color: String = "theme_override_colors/font_outline_color"
		
		if is_locked:
			bullet.texture = disabled_sprite
			label.set(font_color, Color.SLATE_GRAY)
			label.set(font_outline_color, Color8(20, 36, 44))
		elif is_selected:
			bullet.texture = selected_sprite
			label.set(font_color, Color8(249, 210, 118))
			label.set(font_outline_color, Color8(255, 160, 72))
		else:
			bullet.texture = normal_sprite
			label.set(font_color, Color.WHITE)
			label.set(font_outline_color, Color8(20, 36, 44))
			
			
var is_locked: bool:
	get: 
		return (state & States.LOCKED) != States.NONE
	set(value):
		if value:
			state |= States.LOCKED
		else:
			state &= ~States.LOCKED
			
			
var is_selected: bool:
	get:
		return (state & States.SELECTED) != States.NONE
	set(value):
		if value:
			state |= States.SELECTED
		else:
			state &= ~States.SELECTED
			
			
var title: String:
	get:
		return label.text
	set(value):
		label.text = value
	
	
func reset():
	state = States.NONE
