extends CharacterBody2D

# ============================================
# EXPORTS
# ============================================
@export var speed: float = 100.0
@export var gravity: float = 1200.0

# ============================================
# VARIABLES
# ============================================
var direction: int = 1
var tracked_player: Node2D = null

# ============================================
# NODE REFERENCES
# ============================================
@onready var ray_ground: RayCast2D = $Ground_RayCast
@onready var sprite: Sprite2D = $Sprite2D
@onready var alarm: Label = $Alarm
@onready var detection_area: Area2D = $Area2D
@onready var detection_shape: CollisionShape2D = $Area2D/detection_area

# ============================================
# LIFECYCLE
# ============================================
func _ready() -> void:
	alarm.visible = false
	detection_shape.disabled = false


func _physics_process(delta: float) -> void:
	# Apply gravity when not on floor
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Move horizontally
	velocity.x = direction * speed
	move_and_slide()
	
	# Check for walls or edges
	if is_on_wall() or not ray_ground.is_colliding():
		flip_direction()
	
	# Continuously check if tracked player entered stealth
	if tracked_player and tracked_player.is_in_group("Stealth"):
		alarm.visible = false
		tracked_player = null

# ============================================
# MOVEMENT
# ============================================
func flip_direction() -> void:
	direction *= -1
	sprite.flip_h = (direction < 0)
	
	# Flip positions for raycast, alarm, and detection area
	ray_ground.position.x *= -1
	alarm.position.x *= -1
	detection_shape.position.x *= -1

# ============================================
# DETECTION SIGNALS
# ============================================
func _on_area_2d_body_entered(body: Node2D) -> void:
	# Check if body is in stealth group - don't detect them
	if body.is_in_group("Stealth"):
		return
	
	# Only show alarm for normal (non-stealth) players
	if body.is_in_group("Player") and not body.is_in_group("Stealth"):
		tracked_player = body
		alarm.visible = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body == tracked_player or body.is_in_group("Player") or body.is_in_group("Stealth"):
		alarm.visible = false
		tracked_player = null
