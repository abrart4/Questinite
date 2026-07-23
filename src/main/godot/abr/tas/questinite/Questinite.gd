extends Node


func _ready() -> void:
	print("Starting Questinite")
	QuestionManager.init()
	print(QuestionManager.getRandomQuestionData())
	

func delay(seconds):
	return get_tree().create_timer(seconds).timeout
