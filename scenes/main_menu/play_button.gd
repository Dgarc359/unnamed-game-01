extends Button

const THROW_SHURIKEN = preload("res://scenes/throw_shuriken.tscn")
const LEVEL_SELECT = preload("res://scenes/level_select/level_select.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	get_tree().change_scene_to_packed(LEVEL_SELECT)
	pass # Replace with function body.
