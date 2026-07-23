extends Node

var json
var questionJsonString
var questionArray

@onready var QuestionLabel = $"../ScreenLayer/QuestionLabel"
@onready var Strength = $"../ScreenLayer/Strength"
var questionActive
var currentQuestion

func _ready():
	json = JSON.new()
	questionJsonString = FileAccess.open("res://src/main/resources/questions.json", FileAccess.READ).get_as_text()
	var error = json.parse(questionJsonString)
	questionArray = json.data
	print("Loaded QuestionManager with error " + str(error) + " and " + str(questionArray.size()) + " questions")
	
func getRandomQuestionData():
	var question = questionArray.pick_random()
	var type = question["type"]
	var dictionary = {
		"text": "",
		"answers": [],
		"correctAnswerIndex": 0
	}
	if type == "static": 
		dictionary["text"] = question["text"]
		var answerProvider = question["answerProvider"]
		var answerType = answerProvider["answerType"]
		if answerType == "static":
			dictionary["answers"] = answerProvider["answers"]
			dictionary["correctAnswerIndex"] = answerProvider["correctAnswerIndex"]
	return dictionary
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("request_question") && !questionActive:
		questionActive = true
		currentQuestion = getRandomQuestionData()
		QuestionLabel.update(currentQuestion)

	if questionActive:
		for i in range(1, 5):
			if Input.is_action_just_pressed("answer_" + str(i)):
				var correspondingIndex = i - 1
				var correctIndex = currentQuestion.correctAnswerIndex
				var correct = correspondingIndex == correctIndex
				QuestionLabel.add("Correct" if correct else "Incorrect")
				QuestionLabel.add(", the answer was \"" + currentQuestion.answers[correctIndex] + "\"!")
				if correct:
					Strength.increment()
					QuestionLabel.add(" +1 Strength")
				questionActive = false
				await Questinite.delay(2)
				QuestionLabel.clear()	
					
		
