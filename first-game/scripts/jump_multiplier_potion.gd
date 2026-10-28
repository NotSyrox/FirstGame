extends Area2D

@onready var timer: Timer = $Timer
var player = null;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_body_entered(body: Node2D) -> void:
	body.maxJumpAmount += 1
	player = body
	queue_free()


func _on_timer_timeout() -> void:
	if player == null:
		pass
	else:
		player.maxJumpAmount -=1
