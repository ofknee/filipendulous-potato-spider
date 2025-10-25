extends CharacterBody2D
var spider : Spider
var spider_offset: int = 348 
var averaging
var screen_size: Vector2
var acc


func _ready():
	screen_size = get_viewport_rect().size
	spider = get_node("../../philipTheSpider") as Spider
	velocity.x = randf()*-30
	position = Vector2(909+50, randf_range(0, screen_size.y))
	acc = randf()*5


func _physics_process(delta):
	velocity.x -= acc
	#print("delta ", delta)
	if position.x < 50:
		queue_free()
	move_and_slide()

func _on_coll_body_entered(body: Node2D) -> void:
	if body.name == "philipTheSpider": # Replace with function body.
		spider.damage(5.0)
		queue_free()





	#tracking
	#print("bullet: ", position.y)
	#averaging = (4000  - (spider.position.x - position.x))/100
	#position.x -= 1.7
	#position.y = (spider.position.y + spider_offset + position.y*averaging)/(averaging+1)
	#look_at(Vector2(spider.position.x, spider.position.y+spider_offset+100))
	#velocity *= Vector2(1.02,1.02)
	
	#velocity = transform.x * Input.get_axis("down", "up") * speed

	move_and_slide()
	
