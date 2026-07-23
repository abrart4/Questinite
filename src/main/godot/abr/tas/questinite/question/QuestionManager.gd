extends Node

var json
var questionJsonString
var questionArray

func init():
	json = JSON.new()
	questionJsonString = FileAccess.open("res://src/main/resources/questions.json", FileAccess.READ).get_as_text()
	var error = json.parse(questionJsonString)
	questionArray = json.data
	print("Loaded QuestionManager with error " + str(error) + " and " + str(questionArray.size()) + " questions")
	
func getRandomQuestionData():
	var question = questionArray.pick_random()
	var type = question["type"]
	var dictionary = {
		"question": "",
		"answers": [],
		"correctAnswerIndex": 0
	}
	if type == "static": 
		dictionary["question"] = question["question"]
		var answerProvider = question["answerProvider"]
		var answerType = answerProvider["answerType"]
		if answerType == "static":
			dictionary["answers"] = answerProvider["answers"]
			dictionary["correctAnswerIndex"] = answerProvider["correctAnswerIndex"]
	return dictionary
		
