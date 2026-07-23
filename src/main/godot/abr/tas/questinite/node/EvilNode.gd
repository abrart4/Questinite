extends Node2D

func _ready():
	add_theme_font_size_override("font_size", 24)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func start():
	print("im evil")
	
