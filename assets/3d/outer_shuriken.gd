extends Node3D

func _input(event):
	#if event is InputEventMouseMotion:
		#
		#
		#pass
		##camera.rotate_y(deg_to_rad(-event.relative.x * mouse_sensivity))
		###camera.rotate_x(deg_to_rad(event.relative.y * mouse_sensivity))
		##camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-90), deg_to_rad(45))
	#
	#
	## rotation is within bounds, allow rotation
	#if rotation.x > -45 and rotation.x < 45:
		#var input_dir := Input.get_vector("tilt_left", "tilt_right", "tilt_up", "tilt_down")
		#var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		##print(direction.x)
		#rotation.x = clamp(lerp(rotation.x, rotation.x + direction.x, 0.1), -45, 45)
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if not Input.is_action_pressed("tilt_up") or not Input.is_action_pressed("tilt_down"):
		#rotation.x = lerp(rotation.x, 0.0, 0.01)
	pass
