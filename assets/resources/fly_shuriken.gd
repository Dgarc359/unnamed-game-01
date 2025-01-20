extends Resource
class_name ShurikenResource

@export var velocity_factor: float = 1

func save():
	ResourceSaver.save(self)
	pass

func set_velocity(vf: float):
	velocity_factor = vf
	save()
	pass
	

func reset_velocity():
	velocity_factor = 1
	save()
	pass

func get_velocity():
	return velocity_factor
