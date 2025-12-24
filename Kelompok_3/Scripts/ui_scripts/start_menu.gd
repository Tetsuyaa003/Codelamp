extends Control

func _on_new_game_pressed():
    GameManager.start_new_game()

func _on_continue_pressed():
    GameManager.continue_game()

func _on_option_pressed():
    get_tree().change_scene_to_file("res://Scenes/ui/OptionsMenu.tscn")

func _on_quit_pressed():
    get_tree().quit()
