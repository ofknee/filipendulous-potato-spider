extends CanvasLayer
class_name UI

@export var health_bar : TextureProgressBar
@export var tutorial_panel : Panel
@export var restart_but : Button
@export var end_panel : Panel

func _ready() -> void:
	end_panel.hide()
	restart_but.connect("pressed", _restart)

func show_end():
	get_tree().paused = true
	end_panel.show()

func _restart():
	get_tree().paused = false
	get_tree().reload_current_scene()

func update_health(new_health:float):
	health_bar.value = new_health

func hide_tutorial_panel():
	tutorial_panel.hide()
