extends CharacterBody2D
var spider
var spider_offset: int = 348 
var averaging

func _ready():
	spider = get_node("../../philipTheSpider")
	velocity.x = -1

func _physics_process(delta):
	print("bullet: ", position.y)
	averaging = (5000- (spider.position.x - position.x))/100
	position.x -= 1.7
	position.y = (spider.position.y + spider_offset + position.y*averaging)/(averaging+1)
	look_at(Vector2(spider.position.x, spider.position.y+spider_offset+100))
	velocity *= Vector2(1.02,1.02)
	#velocity = transform.x * Input.get_axis("down", "up") * speed

	move_and_slide()
	

	
