extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_evil_cutscene_area_body_entered(body: Node2D) -> void:
	print(body.name)
