extends Label

func _ready():
	add_theme_font_size_override("font_size", 24)

func update(question):
	clear()
	append("Question:")
	append(question.text)
	for i in range(0, question.answers.size()):
		append(str(i + 1) + ". " + question.answers[i])
		
func append(string):
	add(string + "\n")
	
func add(string):
	text += string
	
func clear():
	text = ""
