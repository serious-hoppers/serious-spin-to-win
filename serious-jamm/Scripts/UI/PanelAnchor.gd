class_name PanelAnchor
extends Resource

@export var anchor_name: String
@export var anchor: Control.LayoutPreset
@export var parent_anchor: Control.LayoutPreset
@export var offset: Vector2
@export var duration: float = .5
@export var trans: Tween.TransitionType = Tween.TRANS_LINEAR
@export var anchor_ease: Tween.EaseType = Tween.EASE_IN_OUT

func set_values(
	anchor_name: String,
	anchor: Control.LayoutPreset,
	offset: Vector2,
	duration: float = .5,
	trans: Tween.TransitionType = Tween.TRANS_LINEAR,
	anchor_ease: Tween.EaseType = Tween.EASE_IN_OUT
) -> void:
	self.anchor_name = anchor_name
	self.anchor = anchor
	self.offset = offset
	self.duration = duration
	self.trans = trans
	self.anchor_ease = anchor_ease
