extends Node3D
class_name CollidableCube

## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

func _on_collidable_area_body_entered(body: Node3D) -> void:
	print("collidable area body entered", body.get_groups())
	
	var groups = body.get_groups()
	
	if groups.has("player") and body is Shuriken:
		#print('found shuriken')
		body.collided(250)
	
	pass
	
