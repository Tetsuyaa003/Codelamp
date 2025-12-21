extends Node

@export var required_key_id: int

func try_open():
	if Global.has_key(required_key_id):
		Global.use_key(required_key_id)
		queue_free() # pintu terbuka
