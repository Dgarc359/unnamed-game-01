extends RigidBody3D


func push_object():
	const force = Vector3(100, 0.0, 0.0)
	add_constant_force(force)
	add_constant_force(Vector3(0, 0, 0))

func rotate_object():
	#const rotation = Vector3()
	var transform_basis = transform.basis.z
	rotate(transform_basis, 90)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#push_object()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#const rotation = Vector3(0.1, 0.0, 0.0)
	pass
