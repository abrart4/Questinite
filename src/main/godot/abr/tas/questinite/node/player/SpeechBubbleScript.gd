extends Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func fade_in():
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 1, 1)
	
func fade_out():
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0, 1)
	
	

	
