class_name Ship extends CharacterBody2D

@onready var target_rotation: Node2D = $TargetRotation
@onready var heading: Node2D = $Heading
@onready var velocity_heading: Node2D = $VelocityHeading
@onready var engine_container: Node2D = $EngineContainer

@export var DryMass: float = 1000
@export var EngineForce: float
@export var RCSForce: float
@export var ShieldingIntegrity: float
@export var HullIntegrity: float
@export var FuelCapacity: float
@export var RCSFuelCapacity: float

var Acceleration: Vector2
var RotationSpeed: float
var TargetRotation: float
var RCSAcceleration: Vector2
var TotalMass: float
var EnginePower: float

func _ready() -> void:
	TotalMass = DryMass

func _process(delta: float) -> void:
	if velocity == Vector2.ZERO:
		velocity_heading.hide()
	else:
		velocity_heading.show()
func _physics_process(delta: float) -> void:
	ChangeEnginePower()
	RotateShip()
	ApplyEngineForce()
	ApplyRCSForce()
	velocity += (Acceleration+RCSAcceleration).rotated(rotation)
	move_and_slide()

func ApplyEngineForce() -> void:
	var EngineThrustDirection: float = 0
	if Input.is_action_pressed("EngineOn"):
		EngineThrustDirection = 1
	else:
		EngineThrustDirection = 0
	Acceleration = (Vector2(EngineForce/TotalMass, 0)*EnginePower)*EngineThrustDirection

func RotateShip() -> void:
	var RotationDirection: float = Input.get_axis("RotateLeft", "RotateRight")
	RotationSpeed = 0.01*RotationDirection
	TargetRotation += RotationSpeed
	target_rotation.global_rotation = TargetRotation
	heading.global_rotation = rotation
	var v: Vector2 = get_real_velocity()
	velocity_heading.global_rotation = atan2(v.y, v.x)
	rotation = lerp_angle(rotation, TargetRotation, 0.01)

func ApplyRCSForce() -> void:
	var RCSForceDirection: Vector2 = Input.get_vector("TranslateBackward","TranslateForward", "TranslateLeft", "TranslateRight").normalized()
	RCSAcceleration = (RCSForce/TotalMass)*RCSForceDirection

func ChangeEnginePower() -> void:
	var increment: float = 0.01
	if Input.is_action_pressed("IncreaseEnginePower"):
		EnginePower = clampf(EnginePower + increment, 0, 1)
	if Input.is_action_pressed("DecreaseEnginePower"):
		EnginePower = clampf(EnginePower - increment, 0, 1)
