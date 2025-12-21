extends Node

@onready var ray_wall = 
@onready var ray_ground:

var player_health : int = 5
var key_has_collected: bool = false

var keys: Dictionary = {} # { key_id: true }

func add_key(id: int) -> void:
	keys[id] = true

func has_key(id: int) -> bool:
	return keys.has(id)

func use_key(id: int) -> void:
	keys.erase(id)


func _ready() -> void:
	pass # Replace with function body.


func _process(_delta: float) -> void:
	pass
