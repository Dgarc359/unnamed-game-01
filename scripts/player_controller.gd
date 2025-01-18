extends CharacterBody3D


const SPEED = 5.0
const FRICTION = SPEED / 4
const JUMP_VELOCITY = 4.5
@onready var camera: CameraOrigin = $CameraOrigin
@export var model: Node3D
@export var mouse_sensivity = 0.02


func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	pass

func _input(event):
	if event is InputEventMouseMotion:
		## TODO: Mouse rotation is affected by current velocity
		rotate_y(deg_to_rad(-event.relative.x * mouse_sensivity))
		#camera.rotate_x(deg_to_rad(event.relative.y * mouse_sensivity))
		#camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-90), deg_to_rad(45))

	pass

func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("tilt_left", "tilt_right", "tilt_up", "tilt_down")
	var direction := (transform.basis * Vector3(-input_dir.x, 0, input_dir.y)).normalized()
	
	velocity.x += - camera.get_camera_direction().x
	velocity.z += - camera.get_camera_direction().z
	
	if direction:
		velocity.x += direction.x * SPEED
		velocity.z += direction.z * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, FRICTION)
		#velocity.z = move_toward(velocity.z, 0, FRICTION)

	move_and_slide()
