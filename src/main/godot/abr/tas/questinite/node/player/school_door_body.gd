extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
func _process(delta: float):
	if Input.is_action_just_pressed("interact") and get_overlapping_bodies().any(func(body): return body.name == "PlayerBody"):
		get_parent().startSchool()
		
	
	
