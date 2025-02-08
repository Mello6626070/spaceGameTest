extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	global_rotation = atan2(get_global_mouse_position().y-global_position.y, get_global_mouse_position().x-global_position.x)
