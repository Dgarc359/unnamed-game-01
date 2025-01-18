extends Node
class_name CameraOrigin

@onready var camera: Camera3D = $Camera3D

func get_camera_direction():
	return camera.get_global_transform().basis.z

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
