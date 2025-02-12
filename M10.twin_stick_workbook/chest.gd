extends Area2D
class_name Chest
@export var spawn: Array[Item] = []
var is_player_near = false
@onready var oppen: AnimationPlayer = $AnimationPlayer
var is_open := false


# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _unhandled_input(event: InputEvent) -> void:
	if is_player_near and event.is_action_pressed("interact") and not is_open:
		oppen.play("open")
		spawn_items()
		is_open = true
func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		is_player_near = true
		#spawn_items()
	#if is_open:
		#return
	#is_open = true
	#
	#print("fhfsd")
	

func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		is_player_near = false

func spawn_items():
	if spawn == []:
		return
	var item: Item = spawn.pick_random()
	var pickup: Pickup = preload("res://Scenes/pickup.tscn").instantiate()
	pickup.item = item
	add_child(pickup)
	var random_angle := randf_range(0.0, 2.0 * PI)
	var random_direction := Vector2(1.0, 0.0).rotated(random_angle)
	var land_position := random_direction * randf_range(60.0, 120.0)

	const FLIGHT_TIME := 0.4
	const HALF_FLIGHT_TIME := FLIGHT_TIME / 2.0

	var tween := create_tween()
	tween.set_parallel()
	pickup.scale = Vector2(0.25, 0.25)
	tween.tween_property(pickup, "scale", Vector2(1.0, 1.0), HALF_FLIGHT_TIME)
	tween.tween_property(pickup, "position:x", land_position.x, FLIGHT_TIME)

	tween = create_tween()
	tween.set_trans(Tween.TRANS_QUAD)
	tween.set_ease(Tween.EASE_OUT)
	var jump_height := randf_range(30.0, 80.0)
	tween.tween_property(pickup, "position:y", land_position.y - jump_height, HALF_FLIGHT_TIME)
	tween.set_ease(Tween.EASE_IN)
	tween.tween_property(pickup, "position:y", land_position.y, HALF_FLIGHT_TIME)
