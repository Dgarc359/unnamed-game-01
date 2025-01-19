extends Node3D
class_name BlenderCube


@onready var cube: MeshInstance3D = $Cube
@export var custom_material: ORMMaterial3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cube.material_override = custom_material
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
