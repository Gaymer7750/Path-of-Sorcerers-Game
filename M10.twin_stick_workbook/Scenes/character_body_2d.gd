extends CharacterBody2D

const GODOT_DOWN = preload("res://player/godot_bottom.png")
const GODOT_DOWN_RIGHT = preload("res://player/godot_bottom_right.png")
const GODOT_RIGHT = preload("res://player/godot_right.png")
const GODOT_UP = preload("res://player/godot_up.png")
const GODOT_UP_RIGHT = preload("res://player/godot_up_right.png")

const UP_RIGHT = Vector2.UP + Vector2.RIGHT
const UP_LEFT = Vector2.UP + Vector2.LEFT
const DOWN_RIGHT = Vector2.DOWN + Vector2.RIGHT
const DOWN_LEFT = Vector2.DOWN + Vector2.LEFT

var max_speed := 600.0

@onready var _skin: Sprite2D = %Skin


func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * max_speed
	move_and_slide()
	
	var direction_discrete := direction.sign()
	match direction_discrete:
		Vector2.RIGHT, Vector2.LEFT:
			_skin.texture = GODOT_RIGHT
		Vector2.UP:
			_skin.texture = GODOT_UP
		Vector2.DOWN:
			_skin.texture = GODOT_DOWN
		Vector2.
		
