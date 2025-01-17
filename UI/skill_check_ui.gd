extends Control

@export var marker_speed: float = 300.0  # Speed of the moving marker
var moving_right: bool = true
var is_active: bool = true

@onready var marker: Marker = $MeterBackground/Marker
@onready var green_zone = $MeterBackground/GreenZone
@onready var yellow_zone = $MeterBackground/YellowZone
@onready var red_zone = $MeterBackground/RedZone
const FLY_SHURIKEN_LEVEL_SECTION = preload("res://scenes/fly_shuriken_level_section.tscn")
func _process(delta):
	if is_active:
		move_marker(delta)

func move_marker(delta):
	var meter_width = $MeterBackground.size.x
	if moving_right:
		marker.position.x += marker_speed * delta
		if marker.position.x >= meter_width - marker.size.x:
			moving_right = false
	else:
		marker.position.x -= marker_speed * delta
		if marker.position.x <= 0:
			moving_right = true

func _input(event):
	if is_active and event.is_action_pressed("ui_accept"):  # Spacebar/Enter by default
		is_active = false
		marker.apply_glow("blue")
		evaluate_result()

func evaluate_result():
	var marker_x = marker.position.x
	if green_zone.get_rect().has_point(Vector2(marker_x, 0)):
		print("Perfect! Green Zone: Max Speed and Stability!")
	elif yellow_zone.get_rect().has_point(Vector2(marker_x, 0)):
		print("Good! Yellow Zone: Average Speed and Stability!")
	else:
		print("Poor! Red Zone: Slow and Unstable!")
	
	await get_tree().create_timer(3).timeout  # Wait 3 seconds
	get_tree().change_scene_to_packed(FLY_SHURIKEN_LEVEL_SECTION)
