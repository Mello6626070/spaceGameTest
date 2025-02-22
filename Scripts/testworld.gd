extends Node2D

@onready var behemoth: Ship = $Behemoth
@onready var ship_stats_label: Label = $UI/ShipStatsLabel

func _process(delta: float) -> void:
	ship_stats_label.text = "Velocity: " + str(behemoth.velocity) + " Heading: " + str(rad_to_deg(behemoth.rotation)) + " Engine Power: " + str(behemoth.EnginePower) + " Acceleration: " + str(behemoth.Acceleration.x) + " Position: " + str(behemoth.position) 
