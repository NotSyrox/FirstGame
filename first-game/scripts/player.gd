extends CharacterBody2D


const DEFAULT_SPEED = 130
var SPEED = 130.0
var JUMP_VELOCITY = -300.0
var maxJumpAmount = 1
var currentJumps = 0
var allow_input = true

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if is_on_floor():
		currentJumps = 0

	# Handle jump.
	if Input.is_action_just_pressed("jump") and not is_on_floor() and (maxJumpAmount - currentJumps >= 1) and currentJumps != 0 and allow_input:
		currentJumps += 1
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("jump") and is_on_floor() and allow_input:
		currentJumps += 1
		velocity.y = JUMP_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
		
		
	if direction and allow_input:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
