extends Node2D

func _on_evil_cutscene_area_body_entered(body: Node2D) -> void:
	if body.name == "PlayerBody":
		$"../EvilBody".start()
		

func _on_evil_area_body_entered(body: Node2D) -> void:
	if body.name == "PlayerBody":
		$"../EvilBody".onCollide()
		
func win():
	create_tween().tween_property($PlayerBody/PlayerCamera, "zoom", Vector2(2, 2), 2)
	$PlayerBody/AnimatedSprite2D.play("victory_dance")
