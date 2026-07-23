extends Label

var strength = 1

func _ready():
	add_theme_font_size_override("font_size", 24)

func increment():
	strength = strength + 1
	text = "Strength: " + str(strength)
	
