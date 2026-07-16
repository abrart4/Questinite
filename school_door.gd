extends Area2D

var inside = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if inside and Input.is_action_just_pressed("interact"):
		print("entering door...")


func _on_body_entered(body: Node2D) -> void:
	inside = true


func _on_body_exited(body: Node2D) -> void:
	inside = false
