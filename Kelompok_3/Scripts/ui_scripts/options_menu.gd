extends Control

@onready var music_slider = $"VBoxContainer/Music/HSlider"
@onready var sfx_slider = $"VBoxContainer/SFX/HSlider"
@onready var language_option = $"VBoxContainer/Language/OptionButton"

func _ready():
    pass
    # Uncomment when GameManager has these properties:
    # music_slider.value = GameManager.music_volume
    # sfx_slider.value = GameManager.sfx_volume
    # language_option.select(GameManager.language)

func _on_music_slider_value_changed(_value):
    pass
    # GameManager.set_music_volume(value)

func _on_sfx_slider_value_changed(_value):
    pass
    # GameManager.set_sfx_volume(value)

func _on_language_option_item_selected(_index):
    pass
    # GameManager.set_language(index)

func _on_back_pressed():
    get_tree().change_scene_to_file("res://Scenes/ui/StartMenu.tscn")
