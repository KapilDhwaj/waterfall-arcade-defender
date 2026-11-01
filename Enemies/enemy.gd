extends Area2D

@export var speed: float = 160.0
@export var enemy_textures: Array[Texture2D] = []
func _ready():
	# Connect collision signal
	body_entered.connect(_on_body_entered)
	
	# Pick a random enemy sprite if textures are provided

func _process(delta):
	# Move downward each frame
	position.y += speed * delta
	
	# Delete enemy when it falls past the bottom of the screen
	if position.y > 600:
		queue_free()
		
func _on_body_entered(body):
	print("Collided with: ", body.name)
	
	if body.is_in_group("player"):
		print("Player hit detected!")
		game_over()
		

func game_over():
	# Restart the level on hit
	get_tree().paused = true
