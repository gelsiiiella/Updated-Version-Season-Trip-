extends AnimatableBody3D

var turn_speed = 1.0  # Adjust the turning speed as needed
var turning_left = false
var turning_right = false

func _process(delta):
	if Input.is_action_pressed("ui_left"):
		turning_left = true
		turning_right = false
	elif Input.is_action_pressed("ui_right"):
		turning_right = true
		turning_left = false
	else:
		turning_left = false
		turning_right = false

	if turning_left:
		rotate_y(turn_speed * delta)
	elif turning_right:
		rotate_y(-turn_speed * delta)
