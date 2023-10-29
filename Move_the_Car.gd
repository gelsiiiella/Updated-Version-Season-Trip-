extends VehicleBody3D

const MAX_SPEED = 20
const ENGINE_POWER = 300
const MAX_TURN_SPEED = 1.0
const TURN_ACCELERATION = 2.0

@onready var camera_pivot = $CameraPivot
@onready var camera_3d = $CameraPivot/Camera3D
@onready var reverse_camera = $CameraPivot/ReverseCamera

var current_speed = 0.0
var turn_speed = 0.0

func _physics_process(_delta):
	var acceleration_input = 0.0
	var steer_input = 0.0
	var forward_direction = transform.basis.x.normalized()

	if Input.is_action_pressed("ui_right"):
		steer_input = 1.0
	if Input.is_action_pressed("ui_left"):
		steer_input = -1.0
	if Input.is_action_pressed("ui_up"):
		acceleration_input = 1.0
	if Input.is_action_pressed("ui_down"):
		acceleration_input = -1.0

	var engine_force_vec = forward_direction * acceleration_input * ENGINE_POWER
	linear_velocity = engine_force_vec

	var target_turn_speed = steer_input * MAX_TURN_SPEED
	turn_speed = lerp(turn_speed, target_turn_speed, TURN_ACCELERATION * _delta)
	angular_velocity.y = turn_speed

	
