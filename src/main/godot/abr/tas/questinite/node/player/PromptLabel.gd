extends Label

func _ready():
	add_theme_font_size_override("font_size", 48)

func setLabel(labelText):
	text = labelText
