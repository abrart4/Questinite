extends Label

func _ready():
	add_theme_font_size_override("font_size", 24)

func update(message):
	text = message
