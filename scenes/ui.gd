extends CanvasLayer
class_name UI

@export var health_bar : TextureProgressBar

func _ready() -> void:
	pass

func update_health(new_health:float):
	heanth_bar.value = new_health
