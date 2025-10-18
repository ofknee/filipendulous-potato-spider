extends CanvasLayer
class_name UI

@export var health_bar : TextureProgressBar
@export var tutorial_panel : Panel

func _ready() -> void:
	pass

func update_health(new_health:float):
	health_bar.value = new_health

func hide_tutorial_panel():
	tutorial_panel.hide()
