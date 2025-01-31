extends CharacterBody2D
class_name Player
var max_speed := 800.0



@export var acceleration := 1200.0

@export var deceleration := 1080.0
@export var max_health := 5

var health := max_health: set = set_health
func set_health(new_health: int) -> void:
	var previous_health := health
	health = clampi(new_health, 0, max_health)
	#_health_bar.value = health
func hurt():
	health -= 1

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var has_input_direction := direction.length() > 0.0
	if has_input_direction:
		var desired_velocity := direction * max_speed
		velocity = velocity.move_toward(desired_velocity, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, deceleration * delta)
	move_and_slide()

	

		
