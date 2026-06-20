extends Node
class_name RouletteManager

@export var chamber_count: int = 6
var _current_chamber: int
var _loaded_chamber: int

var _rng: RandomNumberGenerator


func _ready():
	_rng = RandomNumberGenerator.new()
	reset()


func reset() -> void:
	# This could be random weighted
	# https://docs.godotengine.org/en/stable/classes/class_randomnumbergenerator.html#class-randomnumbergenerator-method-rand-weighted()
	_loaded_chamber = _rng.randi_range(1, chamber_count)
	_current_chamber = 0


func next() -> void:
	_current_chamber += 1


func is_bullet() -> bool:
	return _current_chamber == _loaded_chamber


func remaining() -> int:
	return chamber_count - _current_chamber