extends Node2D

var hasStartedSchool = false
@onready var playerBody = $"../PlayerNode/PlayerBody"
var delay = 2

func professorPrompt(message):
	$ProfessorSprite/PromptLabel.setLabel(message)

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
	professorPrompt("Hello!")
	await Questinite.delay(delay)
	professorPrompt("It seems like you want to enter the school, but we're unfortunately closed.")
	await Questinite.delay(delay)
	professorPrompt("You were in the right track, though.")
	await Questinite.delay(delay)
	professorPrompt("There are very evil creatures here, but their weakness is education.")
	await Questinite.delay(delay)
	professorPrompt("Answering questions correctly increases your strength, and there is no limit.")
	await Questinite.delay(delay)
	professorPrompt("Fortunately, I can educate you with different questions.")
	await Questinite.delay(delay)
	professorPrompt("At any place or time, you can press Q to answer a random question and gain strength.")
	await Questinite.delay(delay)
	professorPrompt("...")
	await Questinite.delay(delay)
	professorPrompt("You're a gamer, so you want to encounter the evil on purpose?")
	await Questinite.delay(delay)
	professorPrompt("This is fun to you?")
	await Questinite.delay(delay)
	professorPrompt("...")
	await Questinite.delay(delay)
	professorPrompt("Head east.")
	await Questinite.delay(delay)
	playerBody.disableInputs = false
	$"../UfoNode".queue_free()
	$"../SpeechBubbleSprite".queue_free()
	
func _process(delta: float) -> void:
	if Input.is_action_pressed("disable_delay"):
		delay = 0.25
	
	
