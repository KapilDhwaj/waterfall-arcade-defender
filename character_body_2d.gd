extends CharacterBody2D

const SPEED = 250.0
@onready var hit_sound: AudioStreamPlayer = $HitSound
# Replace these two values with the exact numbers you noted from Step 1
const MIN_X = 25.0
const MAX_X = 237.0

func _ready():
	add_to_group("player")

func _physics_process(_delta):
	# Read horizontal input (A/D or Left/Right)
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * SPEED
	velocity.y = 0.0
	
	move_and_slide()
	
	# Lock player tightly against the stone pillars with zero gap
	position.x = clamp(position.x, MIN_X, MAX_X)
