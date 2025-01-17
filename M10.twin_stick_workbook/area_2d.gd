extends Area2D

@export var speed := 1000
var max_range = 100
var traveled_distance = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	const Range = 1200
	var distance := speed * delta 
	var motion := Vector2.RIGHT.rotated(rotation) * distance
	position += motion
	traveled_distance += speed * delta 
	if traveled_distance > Range:
		_destroy()
	
func _destroy():
	queue_free()