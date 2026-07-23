extends Node2D

var hasStartedSchool = false
@onready var playerBody = $"../PlayerNode/PlayerBody"

func startSchool():
	if hasStartedSchool:
		return
	hasStartedSchool = true
	print("Starting school")
	playerBody.disableInputs = true
	var fadeOutTween = create_tween()
	fadeOutTween.tween_property($"../BackgroundMusicManager", "volume_db", -40, 2)
	await fadeOutTween.finished
	$KnockingSFX.play()
	await Questinite.delay(2)
	playerBody.disableInputsOverride = -1
	await Questinite.delay(0.25)
	playerBody.disableInputsOverride = 0
	playerBody.get_node("AnimatedSprite2D").flip_h = false
	$OpeningSFX.play()
	var professorTween = create_tween()
	professorTween.set_parallel(true)
	professorTween.tween_property($ProfessorSprite, "self_modulate:a", 1, 1)
	professorTween.tween_property($ProfessorSprite, "position", Vector2(60, 45), 1)
	professorTween.tween_property($"../BackgroundMusicManager", "volume_db", 0, 1)
	
	
	
