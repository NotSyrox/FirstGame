extends Area2D

@onready var timer: Timer = $Timer
var player = null;
var is_picked_up: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_body_entered(body: Node2D) -> void:
	if is_picked_up:
		return
		
	is_picked_up = true
	
	body.SPEED += 0.25
	print("Speed set to " + str(body.SPEED / body.DEFAULT_SPEED) + "x")
	player = body
	
	monitoring = false
	monitorable = false
	visible = false
	timer.start()


func _on_timer_timeout() -> void:
	if player != null:
		player.SPEED -= 0.25
		print("Speed reset to " + str(player.SPEED / player.DEFAULT_SPEED) + "x")
	queue_free()
