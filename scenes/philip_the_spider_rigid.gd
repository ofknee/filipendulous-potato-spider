extends RigidBody2D

@export var ground_y: float = 500.0  # y-position where it should 'stop' near bottom
@export var bounce_strength: float = 200.0
@export var bounce_damping: float = 0.8
@export var pull_speed: float = 300.0

func _physics_process(delta):
	# Hold Space to move up
	if Input.is_action_pressed("up"): # or "space"
		apply_central_impulse(Vector2(0, -pull_speed * delta))
	
	# Check if near the bottom
	if global_position.y > ground_y:
		var depth = global_position.y - ground_y
		
		# Push upward with a bounce effect
		apply_central_impulse(Vector2(0, -depth * bounce_strength * delta))
		
		# Damp vertical velocity so it doesn't keep bouncing forever
		linear_velocity.y *= -bounce_damping
