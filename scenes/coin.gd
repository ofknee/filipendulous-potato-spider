extends CharacterBody2D
var screen_size: Vector2
var points: int = 0


func _ready():
	screen_size = get_viewport_rect().size
	velocity.x = -1
	position = Vector2(909, randf_range(0, screen_size.y))


func _physics_process(delta):
	velocity.x *=1.08
	#print("delta ", delta)
	if position.x < 50:
		queue_free()
	var collision = move_and_collide(Vector2(-400 * delta, 0))
	if collision:
		if collision.get_collider().name == "philipTheSpider":
			queue_free()
			game_manager.add_coin()





	#tracking
	#print("bullet: ", position.y)
	#averaging = (4000  - (spider.position.x - position.x))/100
	#position.x -= 1.7
	#position.y = (spider.position.y + spider_offset + position.y*averaging)/(averaging+1)
	#look_at(Vector2(spider.position.x, spider.position.y+spider_offset+100))
	#velocity *= Vector2(1.02,1.02)
	
	#velocity = transform.x * Input.get_axis("down", "up") * speed

	move_and_slide()
	

	
