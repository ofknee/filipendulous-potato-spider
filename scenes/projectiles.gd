extends CharacterBody2D
var spider

func _ready():
	spider = get_node("../../philipTheSpider")

func _physics_process(delta):
	velocity.x -= 0.5
	print("bullet: ", position.y)
	position.x -= 1.7
	position.y = (spider.position.y + 349 + position.y*100)/101
	move_and_slide()
	

	
