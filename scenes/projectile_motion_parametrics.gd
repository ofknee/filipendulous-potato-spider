extends Node2D

@onready var bullet_scene = preload("res://scenes/projectiles.tscn")
var time_keeper: float = 0.4

func _ready():
	spawn_bullet()

func spawn_bullet():
	var bullet = bullet_scene.instantiate()
	var screen_size = get_viewport_rect().size
	var random_y = randf_range(0, screen_size.y)
	bullet.position = Vector2(1000, random_y)
	add_child(bullet)
	time_keeper += 0.005
	
func _process(delta):
	if randf() < (0.05 * time_keeper):
		spawn_bullet()

	
