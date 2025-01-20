extends CharacterBody3D
class_name Shuriken

const SPEED = 5.0
const FRICTION = SPEED / 4
const JUMP_VELOCITY = 4.5

var velocity_factor: float = 1
const FLY_SHURIKEN_RESOURCE = preload("res://assets/resources/fly_shuriken.tres")
@export var collision_sound: AudioStreamPlayer
@export var mouse_sensivity = 0.1
@export var shuriken_model: ShurikenModel

@onready var camera: CameraOrigin = $CameraOrigin


var collisioned = false

var valid_movement_states = [
	"normal",
	"collided",
	"frozen"
]
var movement_state = "normal"
var movement_map = {
	"normal": uncollisioned_movement,
	"collided": collided,
	"frozen": frozen_movement_state
}

#func new(_velocity_factor):
	#ResourceLoader.
	#
	#pass

func set_movement_state(_state: String):
	if _state not in valid_movement_states:
		return
	movement_state = _state

func frozen_movement_state(delta: float):
	velocity = Vector3(0, 0, 0)
	shuriken_model.sets_rotation(0)
	pass

func collisioned_movement(delta: float):
	if not is_on_floor():
		velocity += get_gravity() * delta
	velocity.x = move_toward(velocity.x, 0, FRICTION)
	velocity.z = move_toward(velocity.z, 0, FRICTION)
	pass

func collided(bounce_factor: int, collision_callback: Callable = func(n: Node3D): pass):
	# TODO: get collision vector, then find an angle to put another big movement vector towards
	# To simulate the shuriken deflecting off
	collision_sound.play()
	#collisioned = true
	
	velocity.x += sin(velocity.x) * bounce_factor
	##velocity.y += sin(velocity.y) * bounce_factor
	velocity.z += - (sin(velocity.z) * bounce_factor)
	
	if collision_callback:
		collision_callback.call(self)
		pass

	pass

func uncollisioned_movement(delta: float):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("tilt_left", "tilt_right", "tilt_up", "tilt_down")
	var direction := (transform.basis * Vector3(-input_dir.x, input_dir.y, 0)).normalized()
	
	velocity.x += (- camera.get_camera_direction().x) * velocity_factor
	velocity.z += (- camera.get_camera_direction().z) * velocity_factor
	
	if direction:
		velocity.x += direction.x
		velocity.y += direction.y

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	#print("shuriken speed", FLY_SHURIKEN_RESOURCE.get_velocity())
	velocity_factor = FLY_SHURIKEN_RESOURCE.get_velocity()
	pass

func _input(event):
	
	if event is InputEventMouseMotion:
		## TODO: Mouse rotation is affected by current velocity
		rotate_y(deg_to_rad(-event.relative.x * mouse_sensivity))
		#camera.rotate_x(deg_to_rad(event.relative.y * mouse_sensivity))
		#camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-90), deg_to_rad(45))
	pass

func _physics_process(delta: float) -> void:
	#print('velocity', velocity)
	
	movement_map[movement_state].call(delta)
	
	move_and_slide()
