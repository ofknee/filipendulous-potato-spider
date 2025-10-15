extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -300.0


func _physics_process(delta: float) -> void:
	print(velocity.y)
	
	# add the gravity
	velocity += get_gravity()* delta*2
	
	# bounce back
	if position.y > 300:
		velocity.y -= position.y/10	
	if position.y > 370:
		velocity.y -= position.y/5
	velocity.y += 1
	
	if position.y > 320:
		if velocity.y > 0:
			velocity.y -= (position.y - 320)*delta
		if velocity.y > 0:
			velocity.y += (position.y - 320)*delta
	if position.y < 320:
		if velocity.y < 0:
			velocity.y -= (320 - position.y)*delta
		if velocity.y < 0:
			velocity.y += (320 - position.y)*delta

	# Handle jump.
	if Input.is_action_pressed("up"):
		velocity.y = JUMP_VELOCITY
		velocity += get_gravity()* delta * 0.5
		
#	if Input.is_action_pressed("down"):
#		velocity.y = -JUMP_VELOCITY
#		velocity += get_gravity()* delta * 0.8

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
