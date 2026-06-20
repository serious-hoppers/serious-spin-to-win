extends MeshInstance3D

@export var rotation_speed: float = 2.0 # Radians per second


func _process(delta: float) -> void:
	rotate_y(rotation_speed * delta) 
