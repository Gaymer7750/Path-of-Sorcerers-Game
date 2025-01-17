extends Node2D

@export var speed = 100
@export var max_range = 1200
@export var scene = PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("shoot"):
		shoot()
func shoot():
	const BULLET = preload("res://Scenes/bullet.tscn")
	var new_bullet = BULLET.instantiate()
