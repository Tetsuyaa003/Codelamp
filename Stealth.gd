extends Node2D

# ============================================
# SIGNALS
# ============================================
signal stealth_entered(player: CharacterBody2D)
signal stealth_exited(player: CharacterBody2D)

# ============================================
# STATE
# ============================================
var player: CharacterBody2D = null
var player_in_area: bool = false

# ============================================
# NODE REFERENCES
# ============================================
@onready var area: Area2D = $Area2D
@onready var collider: CollisionShape2D = $Area2D/AreaEvent
@onready var hide_marker: Marker2D = $StaticBody2D/Marker2D
@onready var label: Label = $LabelHide
@onready var collide = $StaticBody2D/CollisionShape2D

# ============================================
# LIFECYCLE
# ============================================
func _ready() -> void:
	label.visible = false


func _input(event: InputEvent) -> void:
	if not player_in_area or not player:
		return
	
	# Only toggle when pressing stealth key
	if event.is_action_pressed("stealth") and not event.is_echo():
		if not player.is_stealth:
			enter_stealth()
		else:
			exit_stealth()

# ============================================
# AREA DETECTION
# ============================================
func _on_area_2d_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		player = body
		player_in_area = true
		label.visible = true

func _on_area_2d_body_exited(body: Node) -> void:
	if body == player:
		# Only exit if player is NOT in stealth mode
		if not player.is_stealth:
			player_in_area = false
			label.visible = false
			player = null
		# If in stealth, keep them locked in the hiding spot
		else:
			label.visible = false

# ============================================
# STEALTH MANAGEMENT
# ============================================
func toggle_stealth() -> void:
	if player.is_stealth:
		exit_stealth()
	else:
		enter_stealth()


func enter_stealth() -> void:
	if not player:
		return
	
	# Update player state FIRST
	player.enter_stealth()
	
	# Then teleport player to hiding spot
	player.global_position = hide_marker.global_position
	player.velocity = Vector2.ZERO
	
	# Emit signal
	stealth_entered.emit(player)


func exit_stealth() -> void:
	if not player:
		return
	
	# Update player state
	player.exit_stealth()
	
	# Emit signal
	stealth_exited.emit(player)
