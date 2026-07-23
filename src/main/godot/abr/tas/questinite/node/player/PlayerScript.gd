extends CharacterBody2D


const SPEED = 600.0
const JUMP_VELOCITY = -1600.0


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	elif $AnimatedSprite2D.animation == "jump":
		$AnimatedSprite2D.play("idle")

	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AnimatedSprite2D.play("jump")
		

	var direction := Input.get_axis("left", "right")
	if direction:
		$AnimatedSprite2D.flip_h = direction < 0
		velocity.x = direction * SPEED
		if $AnimatedSprite2D.animation == "idle":
			$AnimatedSprite2D.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if $AnimatedSprite2D.animation == "run":
			$AnimatedSprite2D.play("idle")

	move_and_slide()
