extends RayCast2D


func _physics_process(_delta):
	var _space_state = get_world_2d().direct_space_state
