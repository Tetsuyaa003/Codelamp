extends CharacterBody2D

# ============================================
# CONSTANTS
# ============================================
const PLAYER_SPEED: float = 220.0
const JUMP_STRENGTH: float = -400.0
const GRAVITY: float = 1200.0

# Collision layer constants
const LAYER_NORMAL: int = 1
const LAYER_STEALTH: int = 2

# ============================================
# STATE
# ============================================
var is_stealth: bool = false

# ============================================
# NODE REFERENCES
# ============================================
@onready var player_collision: CollisionShape2D = $PlayerCollision
@onready var player_skin: Sprite2D = $PlayerSkin

# ============================================
# LIFECYCLE
# ============================================
func _ready() -> void:
	add_to_group("Player")


func _physics_process(delta: float) -> void:
	# Don't apply physics when in stealth mode
	if is_stealth:
		velocity = Vector2.ZERO
		return
	
	apply_gravity(delta)
	handle_movement()
	move_and_slide()

# ============================================
# PHYSICS & MOVEMENT
# ============================================
func apply_gravity(delta: float) -> void:
	if not is_on_floor():
		velocity.y += GRAVITY * delta


func handle_movement() -> void:
	# Don't allow movement when in stealth
	if is_stealth:
		velocity.x = 0
		return
	
	# Get horizontal input
	var direction := Input.get_axis("left", "right")
	velocity.x = direction * PLAYER_SPEED
	
	# Handle jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_STRENGTH

# ============================================
# STEALTH SYSTEM
# ============================================
func enter_stealth() -> void:
	"""Called by Stealth node when player enters stealth mode"""
	is_stealth = true
	add_to_group("Stealth")
	
	# Switch collision to stealth layers
	set_collision_layer_value(LAYER_NORMAL, false)
	set_collision_layer_value(LAYER_STEALTH, true)
	set_collision_mask_value(LAYER_NORMAL, false)
	set_collision_mask_value(LAYER_STEALTH, true)


func exit_stealth() -> void:
	"""Called by Stealth node when player exits stealth mode"""
	is_stealth = false
	remove_from_group("Stealth")
	
	# Switch collision back to normal layers
	set_collision_layer_value(LAYER_NORMAL, true)
	set_collision_layer_value(LAYER_STEALTH, false)
	set_collision_mask_value(LAYER_NORMAL, true)
	set_collision_mask_value(LAYER_STEALTH, false)
