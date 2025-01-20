extends Node3D
class_name ShurikenModel

var _rotation = 10

func sets_rotation(r: int):
	_rotation = r

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate_y(_rotation * delta)
	pass
