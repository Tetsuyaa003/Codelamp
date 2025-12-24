extends CharacterBody2D


const SPEED = 300.0
var direction = Vector2.RIGHT

func patrol():
	pass


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_direction := Input.get_axis("ui_left", "ui_right")
	if input_direction:
		velocity.x = input_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
