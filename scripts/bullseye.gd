extends Node3D

var first_impact = null

func handle_area_entered(body: Node3D, area_entered: String) -> void:
	if !first_impact:
		first_impact = area_entered

	print("BULLSEYE HIT", body.get_groups())
	
	var groups = body.get_groups()
	
	if groups.has("player") and body is Shuriken:
		body.set_movement_state("frozen")  # Stop rotation when frozen state is set
		pass
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(first_impact)
	pass



func _on_low_point_area_body_entered(body: Node3D) -> void:
	handle_area_entered(body, "low")
	pass # Replace with function body.

func _on_medium_point_area_body_entered(body: Node3D) -> void:
	handle_area_entered(body, "med")
	pass # Replace with function body.

func _on_high_point_area_body_entered(body: Node3D) -> void:
	handle_area_entered(body, "high")
	pass # Replace with function body.
