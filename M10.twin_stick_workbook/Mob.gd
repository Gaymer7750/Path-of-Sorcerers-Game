extends CharacterBody2D

@export var health := 3: set = set_health
@export var max_speed = 600.0
@onready var _area: Area2D = %Area2D
@onready var _Hit_Box: Area2D = %HitBox
@onready var _Player: Player = null
var acceleration = 700
func _ready() -> void:
	Sgn.Damage.connect(hurt)
func _on_hit_box_body_entered(body: Node2D) -> void:
		if body is Player:
			_Player = body
func hurt():
	health -= 1
	print(health)
func _on_hit_box_body_exited(body: Node2D) -> void:
	_Player = null

const SPEED = 300.0
func die():
	queue_free()
func set_health(new_health: int) -> void:
	health = new_health
	if health <= 0:
		die()
func _physics_process(delta: float) -> void:
	if _Player == null:
		return
	else:
		var direction := global_position.direction_to(get_global_player_position())
		var distance := global_position.distance_to(get_global_player_position())
		var speed = max_speed if distance > 100 else max_speed * distance / 100
		var desired_velocity = direction * speed
		velocity = velocity.move_toward(desired_velocity, acceleration * delta)
	move_and_slide()
func get_global_player_position() -> Vector2:
	return get_tree().root.get_node("Node2D/Player").global_position
