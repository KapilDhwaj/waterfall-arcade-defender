extends Node2D

@export var enemy_scene: PackedScene = preload("res://Enemies/enemy.tscn")

# Safe spawn range between the two 31px stone columns
@export var min_x: float = 55.0
@export var max_x: float = 250.0
@export var spawn_y: float = -40.0 # Spawns just above the top view

@onready var spawn_timer: Timer = $SpawnTimer

func _ready():
	spawn_timer.timeout.connect(_on_spawn_timer_timeout)
	add_to_group("player")
func _on_spawn_timer_timeout():
	if enemy_scene:
		var enemy = enemy_scene.instantiate()
		
		# Pick a random horizontal X position within the corridor
		var random_x = randf_range(min_x, max_x)
		enemy.position = Vector2(random_x, spawn_y)
		
		add_child(enemy)
