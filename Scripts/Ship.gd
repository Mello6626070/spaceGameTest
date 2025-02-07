class_name Ship extends CharacterBody2D

@export var DryMass: float = 1000
@export var EngineForce: float
@export var RSCForce: float
@export var ShieldingIntegrity: float
@export var HullIntegrity: float
@export var FuelCapacity: float
@export var RCSFuelCapacity: float

var Acceleration: Vector2
var RCSAcceleration: float
var TotalMass: float


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	TotalMass = DryMass

func _physics_process(delta: float) -> void:
	var EngineThrustDirection: float = 0
	if Input.is_action_pressed("EngineOn"):
		EngineThrustDirection = 1
		ApplyEngineForce()
	else:
		EngineThrustDirection = 0
	
	velocity += Acceleration*EngineThrustDirection
	move_and_slide()

func ApplyEngineForce() -> void:
	Acceleration = Vector2(EngineForce/TotalMass, 0)
	print(velocity)
