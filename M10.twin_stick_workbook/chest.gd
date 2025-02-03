extends Area2D
class_name Chest
@export var spawn: Array[Item] = []
var is_player_near = false
@onready var oppen: AnimationPlayer = $AnimationPlayer
var is_open := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	open()

func open():
	if is_open:
		return
	is_open = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		is_player_near = true

	oppen.play("open")
	print("fhfsd")


func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		is_player_near = false
