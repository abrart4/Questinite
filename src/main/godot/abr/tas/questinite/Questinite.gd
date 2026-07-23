extends Node

const VOLUME_OFF = -80
const VOLUME_ON = 0

func _ready() -> void:
	print("Starting Questinite")
	

func delay(seconds):
	return get_tree().create_timer(seconds).timeout
