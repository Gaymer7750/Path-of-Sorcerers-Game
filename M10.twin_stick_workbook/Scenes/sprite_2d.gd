extends Sprite2D


const RUNNER_DOWN = preload("res://player/godot_bottom.png")
const RUNNER_DOWN_RIGHT = preload("res://player/godot_bottom_right.png")
const RUNNER_RIGHT = preload("res://player/godot_right.png")
const RUNNER_UP = preload("res://player/godot_up.png")
const RUNNER_UP_RIGHT = preload("res://player/godot_up_right.png")

const UP_RIGHT = Vector2.UP + Vector2.RIGHT
const UP_LEFT = Vector2.UP + Vector2.LEFT
const DOWN_RIGHT = Vector2.DOWN + Vector2.RIGHT
const DOWN_LEFT = Vector2.DOWN + Vector2.LEFT
var SPEED = 600.0
@onready var _skin: Sprite2D = %Skin

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED
	move_and_slide()
	var direction_discrete := direction.sign()
	match direction_discrete:
		Vector2.RIGHT, Vector2.LEFT:
			texture = RUNNER_RIGHT
		Vector2.UP:
			_skin.texture = RUNNER_UP
		Vector2.DOWN:
			_skin.texture = RUNNER_DOWN
		UP_RIGHT, UP_LEFT:
			_skin.texture = RUNNER_UP_RIGHT
		DOWN_RIGHT, DOWN_LEFT:
			_skin.texture = RUNNER_DOWN_RIGHT
			

	 if direction_discrete.length() > 0:
		_skin.flip.h = direction.x < 0.0
