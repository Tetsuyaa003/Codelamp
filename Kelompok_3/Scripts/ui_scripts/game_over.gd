extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


# Retry button - kembali ke level terakhir sebelum mati
func _on_retry_pressed() -> void:
	# Reset player health
	Global.player_health = 5
	# Reload level saat ini dari GameManager
	GameManager.continue_game()


# Home button - kembali ke start menu
func _on_home_pressed() -> void:
	# Reset player health
	Global.player_health = 5
	# Kembali ke start menu
	get_tree().change_scene_to_file("res://Scenes/ui/StartMenu.tscn")
