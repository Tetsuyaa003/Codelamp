extends CharacterBody2D


const walk_speed = 300.0
const jump_strength = -400.0
const gravity = 1200


func _ready() -> void:
	# Tambahkan player ke group "player"
	add_to_group("player")


func apply_gravity(delta):
	velocity.y += gravity*delta


func controller():
	var direction := Input.get_axis("left", "right")
	velocity.x = direction * walk_speed
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_strength


func interact():
	pass


func _physics_process(delta: float) -> void:
	controller()
	move_and_slide()
	apply_gravity(delta)

func _process(delta: float) -> void:
	if Global.player_health <= 0:
		get_tree().change_scene_to_file("res://Scenes/ui/GameOver.tscn")