extends CharacterBody2D
class_name Player
var max_speed := 800.0

@onready var health_bar: ProgressBar = $UI/HealthBar

@export var acceleration := 1200.0
@export var deceleration := 1080.0
@export var max_health := 50
var health := max_health: set = set_health


func _ready() -> void:
	health_bar.max_value = max_health
	health_bar.value = health

func set_health(new_health: int) -> void:
	var previous_health := health
	health = clampi(new_health, 0, max_health)
	health_bar.value = health
#func hurt():
	#health -= 1
	#if health <= 0:
		#player_die()

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var has_input_direction := direction.length() > 0.0
	if has_input_direction:
		var desired_velocity := direction * max_speed
		velocity = velocity.move_toward(desired_velocity, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, deceleration * delta)
	move_and_slide()

func player_die():
	queue_free()
