extends CharacterBody2D

var max_speed := 600.0
## The top speed that the runner can achieve
#@export var max_speed := 600.0
## How much speed is added per second when the player presses a movement key
@export var acceleration := 1200.0
## How much speed is lost per second when the player releases all movement keys
@export var deceleration := 1080.0



func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var has_input_direction := direction.length() > 0.0
	if has_input_direction:
		var desired_velocity := direction * max_speed
		velocity = velocity.move_toward(desired_velocity, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, deceleration * delta)
	move_and_slide()

	
	move_and_slide()
		
