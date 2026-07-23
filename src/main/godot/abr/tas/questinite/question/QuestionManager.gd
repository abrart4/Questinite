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
	
func getRandomQuestion():
	return questionArray.pick_random()
	
func getQuestionData(questionJson):
	var type = questionJson["type"]
	return type
