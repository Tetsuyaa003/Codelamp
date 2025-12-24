extends Node

var current_level := 1

func start_new_game():
    current_level = 1
    load_level(current_level)

func continue_game():
    load_level(current_level)

func load_level(level: int):
    match level:
        1:
            get_tree().change_scene_to_file("res://Scenes/levels/level1.tscn")
        2:
            get_tree().change_scene_to_file("res://Scenes/levels/level2.tscn")
        3:
            get_tree().change_scene_to_file("res://Scenes/levels/level3.tscn")


# =======VOLUME SETTINGS========
var music_volume := 5
var sfx_volume := 5
var language := 0 # 0 = EN, 1 = ID

func set_music_volume(value):
    music_volume = value
    AudioServer.set_bus_volume_db(
        AudioServer.get_bus_index("Music"),
        linear_to_db(value / 10.0)
    )

func set_sfx_volume(value):
    sfx_volume = value
    AudioServer.set_bus_volume_db(
        AudioServer.get_bus_index("SFX"),
        linear_to_db(value / 10.0)
    )

func set_language(index):
    language = index
    match index:
        0:
            TranslationServer.set_locale("en")
        1:
            TranslationServer.set_locale("id")


# =======SAVE SETTINGS========
func save_settings():
    var file = FileAccess.open("user://settings.save", FileAccess.WRITE)
    file.store_var({
        "music": music_volume,
        "sfx": sfx_volume,
        "lang": language
    })

func load_settings():
    if FileAccess.file_exists("user://settings.save"):
        var file = FileAccess.open("user://settings.save", FileAccess.READ)
        var data = file.get_var()
        set_music_volume(data.music)
        set_sfx_volume(data.sfx)
        set_language(data.lang)
