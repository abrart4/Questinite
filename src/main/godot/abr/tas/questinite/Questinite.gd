extends Node


func _ready() -> void:
	print("Starting Questinite")
	

func delay(seconds):
	return get_tree().create_timer(seconds).timeout
