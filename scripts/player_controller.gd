extends CharacterBody3D
class_name Shuriken


const SPEED = 5.0
const FRICTION = SPEED / 4
const JUMP_VELOCITY = 4.5
@onready var camera: CameraOrigin = $CameraOrigin
@export var model: Node3D
@export var mouse_sensivity = 0.1

var collisioned = false


func collisioned_movement(delta: float):
	if not is_on_floor():
		velocity += get_gravity() * delta
	velocity.x = move_toward(velocity.x, 0, FRICTION)
	velocity.z = move_toward(velocity.z, 0, FRICTION)
	pass

func collided(bounce_factor: int):
	# TODO: get collision vector, then find an angle to put another big movement vector towards
	# To simulate the shuriken deflecting off
	#collisioned = true
	
	velocity.x += sin(velocity.x) * bounce_factor
	##velocity.y += sin(velocity.y) * bounce_factor
	velocity.z += - (sin(velocity.z) * bounce_factor)
	
	#velocity.x += cos(velocity.x) * bounce_factor
	#velocity.y += sin(velocity.y) * bounce_factor
	#velocity.z += cos(velocity.z) * bounce_factor
	
	
	
	#velocity.x += tan(velocity.x) * bounce_factor
	#velocity.y += sin(velocity.y) * bounce_factor
	#velocity.z += tan(velocity.z) * bounce_factor
	
	pass

func uncollisioned_movement():
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("tilt_left", "tilt_right", "tilt_up", "tilt_down")
	var direction := (transform.basis * Vector3(-input_dir.x, 0, input_dir.y)).normalized()
	
	velocity.x += - camera.get_camera_direction().x
	velocity.z += - camera.get_camera_direction().z
	
	if direction:
		velocity.x += direction.x * SPEED
		velocity.z += direction.z * SPEED

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
	if not collisioned:
		uncollisioned_movement()
	else:
		collisioned_movement(delta)

	move_and_slide()
