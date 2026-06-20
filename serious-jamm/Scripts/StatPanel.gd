class_name StatPanel
extends Node

@export var bullets_label: Label
@export var game_over_label: Label
@export var video: VideoStreamPlayer
@export var audio: AudioStreamPlayer


func display(obj: Node) -> void:
	bullets_label.show()
	game_over_label.hide()
	video.stop()
	video.paused = true

	var roulette: RouletteManager = obj#.get_node("RouletteManager")
	if roulette:
		print("{0} left".format([roulette.remaining()]))
		bullets_label.text = "{0} left".format([roulette.remaining()])


func game_over() -> void:
	bullets_label.hide()
	game_over_label.show()
	video.paused = false
	video.play()
	audio.play()
	
	
	
