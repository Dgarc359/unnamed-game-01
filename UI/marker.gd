extends ColorRect
class_name Marker

@onready var light: PointLight2D = $PointLight2D  # Reference to the PointLight2D node

func _ready():
	apply_default_glow()

func apply_default_glow():
	light.color = Color(1, 1, 1, 1)  # Soft white glow (default)
	light.energy = 2.0  # Set default intensity
	light.range_z_max = 100.0  # Set range of the light to control its spread
	light.range_z_min = 100.0  # Set range of the light to control its spread

func apply_glow(zone: String):
	match zone:
		"green":
			light.color = Color(0, 1, 0, 1)  # Green glow
			light.energy = 3.0  # Stronger glow for green zone
		"yellow":
			light.color = Color(1, 1, 0, 1)  # Yellow glow
			light.energy = 2.5  # Moderate glow for yellow zone
		"red":
			light.color = Color(1, 0, 0, 1)  # Red glow
			light.energy = 2.0  # Red glow intensity
		"blue":
			light.color = Color(0, 0.5, 1, 1)  # Blue glow when picked
			light.energy = 4.0  # Strongest glow for blue
