extends Button

@export var level_to_switch_to: PackedScene
@export var button: Button

func handle_button_pressed():
	print("pressed")
	get_tree().change_scene_to_packed(level_to_switch_to)

func _ready():
	button.pressed.connect(handle_button_pressed)
