extends CharacterBody2D
class_name Spider

const SPEED = 300.0
const JUMP_VELOCITY = -300.0
var multiplier = 4
var yStop = 250   
var yFixer = -350
var locked_x: float

@onready var ui = %UI as UI
var health : float = 100.
func damage(damage_amount:float):
	health -= damage_amount
	health = clamp(health, 0., 100.)
	ui.update_health(health)
	
	if health == 0:
		ui.show_end()
		

func _ready() -> void:
	locked_x = position.x
	damage(0.)

func _physics_process(delta: float) -> void:
	position.x=locked_x
	velocity.x = 0            
	
	# add the gravity
	velocity += get_gravity()* delta*1.5
	
	# bounce back
	if position.y > 200+yFixer:
		velocity.y -= position.y/10	
		velocity.y /= 1.02
	if position.y > 300+yFixer:
		velocity.y -= position.y/4
	if position.y > 320+yFixer:
		velocity.y -= position.y
		
	if (position.y > 290+yFixer and position.y < 315+yFixer) and abs(velocity.y) < 50:
		velocity.y /= 1.5



	
	#if position.y > yStop:
		#if velocity.y > 0:
			#velocity.y -= (position.y - 320)*delta*multiplier
		#if velocity.y > 0:
			#velocity.y += (position.y - 320)*delta*multiplier
	#if position.y < yStop:
		#if velocity.y < 0:
			#velocity.y -= (320 - position.y)*delta*multiplier
		#if velocity.y < 0:
			#velocity.y += (320 - position.y)*delta*multiplier

	# Handle jump.
	if Input.is_action_pressed("up"):
		velocity.y = JUMP_VELOCITY 
		velocity += get_gravity()* delta 
		
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
