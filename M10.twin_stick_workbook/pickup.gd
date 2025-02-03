extends Area2D
class_name Pickup

@onready var sprite2d: Sprite2D = %Sprite2D
@onready var audio: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var _animation_player: AnimationPlayer = $AnimationPlayer

@export var item: Item = null: set = set_item
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_animation_player.play("Idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		audio.play()
		_animation_player.play("picked")
		await _animation_player.animation_finished
		item.use(body)
		queue_free()
		
func set_item(value: Item) -> void:
	item = value
	if sprite2d != null:
		sprite2d.texture = item.texture
	if audio != null:
		audio.stream = item.sound_on_pickup
