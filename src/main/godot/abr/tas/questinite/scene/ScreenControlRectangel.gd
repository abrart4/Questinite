extends ColorRect

func fadeOut():
	create_tween().tween_property(self, "color", Color(0, 0, 0, 1), 2)
	
