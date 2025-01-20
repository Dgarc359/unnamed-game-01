extends Area3D

@export_range(0, 100, 1.0) var awarded_points: float
@export var area: Area3D

func _ready():
	area.area_entered.connect(handle_area_entered)
