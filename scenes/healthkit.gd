extends Area2D

var spider : Spider

func _ready() -> void:
	spider = get_node("../../philipTheSpider") as Spider



func _on_body_entered(body: Node2D) -> void:
	if body.name == "philipTheSpider": # Replace with function body.
		spider.damage(25.0)
		queue_free()
