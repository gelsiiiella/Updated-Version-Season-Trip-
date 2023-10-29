extends VBoxContainer

var Speed
var Distance
var isGameRunning = true
var elapsedTime = 0.0
var distance = 0.0
var initialSpeed = 1
var acceleration = 1
signal speed_changed(speed)
#var currentSpeed = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Speed = $Speed/SpeedValue
	Distance = $Distance/DistanceValue

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isGameRunning:
		elapsedTime += delta # Increment the custom elapsed time
		var currentSpeed = calculateSpeed(elapsedTime)
		distance += currentSpeed * delta
		speed_changed.emit(currentSpeed)
		# Update the 'Speed' and 'Distance' Labels
		Speed.text = "%.1f" % currentSpeed + " m/s"
		Distance.text = "%.1f" % distance + "meters"

func calculateSpeed(time):
	# Calculate speed based on initial speed and acceleration
	var speed = initialSpeed + acceleration * time
	return speed

	
