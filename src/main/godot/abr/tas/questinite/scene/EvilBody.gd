extends CharacterBody2D

var shouldRunAround = false
var left = true
var health = 50

func _physics_process(delta: float) -> void:
	if (!shouldRunAround):
		return
	if not is_on_floor():
		velocity += get_gravity() * delta
	var direction = -1 if (left) else 1
	if is_on_floor():
		velocity.y = randi_range(-600, -1000)
		left = !left
	var SPEED = randi_range(200, 1600)
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
@onready var playerBody = $"../PlayerNode/PlayerBody"
var delay = 2
	
func dialog(message):
	$EvilSprite/EvilLabel.update(message)
		
func start():
	create_tween().tween_property($"../BackgroundMusicManager", "volume_db", Questinite.VOLUME_OFF, 1)
	playerBody.disableInputs = true
	dialog("...")
	await Questinite.delay(delay)
	dialog("I think you already anticipated this, but...")
	await Questinite.delay(delay)
	dialog("I'm evil.")
	await Questinite.delay(delay)
	dialog("I don't like education.")
	await Questinite.delay(delay)
	dialog("And I know that you are all highly educated.")
	await Questinite.delay(delay)
	dialog("I know I'll tire out, but I'll still try to fight...")
	await Questinite.delay(delay)
	dialog("Ready?")
	await Questinite.delay(delay)
	dialog(str(health) + " HP")
	shouldRunAround = true
	$"../EvilBoundaryBody".queue_free()
	$"../EvilCutsceneArea".queue_free()
	playerBody.disableInputs = false
	$"../EvilMusicManager".play()
	create_tween().tween_property($"../EvilMusicManager", "volume_db", Questinite.VOLUME_ON, 2)
	
func onCollide():
	health = health - $"../ScreenLayer/Strength".strength	
	dialog("Ouch, I'm on " + str(health) + " HP!")
	
func lose():
	shouldRunAround = false
	dialog("Well, I am finally dead...")
	await Questinite.delay(delay)
	dialog("Good game.")
	await Questinite.delay(delay)
	$"../PlayerNode".win()
	
func _process(delta: float) -> void:
	if Input.is_action_pressed("disable_delay"):
		delay = 0.25
	if health <= 0:
		lose()
