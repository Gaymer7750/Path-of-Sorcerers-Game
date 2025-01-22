extends Node2D
@export_range(0, 360, 0.1, "radians_as_degrees") var angle := PI/ 12.0
@export var speed = 100
@export var max_range = 1200
@export var BULLET: PackedScene = preload("res://Scenes/bullet.tscn")
@export var max_BULLET_speed = 1500
# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("shoot"):
		shoot()
		
func shoot():
	var new_bullet: Node = BULLET.instantiate()
	get_tree().current_scene.add_child(new_bullet)
	new_bullet.global_position = global_position
	new_bullet.global_rotation = global_rotation
	new_bullet.max_range = max_range
	new_bullet.speed = max_BULLET_speed
	new_bullet.rotation += randf_range(-angle / 2.0, angle / 2.0)
