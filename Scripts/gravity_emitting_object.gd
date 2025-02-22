extends Node2D

var BodiesInSOP: Array[CharacterBody2D] = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	for body in BodiesInSOP:
		var AccelerationDirection: Vector2 = global_position - body.global_position
		body.velocity += AccelerationDirection*0.1


func _on_area_2d_body_entered(body: Node2D) -> void:
	BodiesInSOP.append(body)


func _on_area_2d_body_exited(body: Node2D) -> void:
	BodiesInSOP.erase(body)
