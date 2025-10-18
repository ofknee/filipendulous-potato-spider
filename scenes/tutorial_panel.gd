extends Panel

func _ready() -> void:
	show()

func _process(delta: float) -> void:
	await get_tree().create_timer(7).timeout
	hide() 	
