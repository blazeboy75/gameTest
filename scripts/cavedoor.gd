extends Area2D


export(String, FILE, "*.tscn,*.scn") var new_scene

func _input(event):

	if get_overlapping_bodies().size() > 1:
		next_level()
		
		
func next_level():
	var PTS = get_tree().change_scene(new_scene)
