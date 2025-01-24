extends CharacterBody2D


@export var max_speed = 600.0
@onready var _area: Area2D = %Area2D
@onready var _Hit_Box: Area2D = %HitBox
@onready var _Player: Player = null

func _ready() -> void:
	_Hit_Box.body_entered.connect(func(body: Node) -> void:
		if body is Player:
			pass)

const SPEED = 300.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
