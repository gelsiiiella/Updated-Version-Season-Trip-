extends Node

var Heart
var min_heart_rate = 60
var max_heart_rate = 100
var current_heart_rate

func _ready():
	Heart = $Heart  # Assuming $Heart is the path to your Label node
	update_heart_rate()
	$Timer.start()

func _on_Timer_timeout():
	update_heart_rate()
	$Timer.wait_time = randf() * 2 + 1  # Random wait time between 1 and 3 seconds
	$Timer.start()

func update_heart_rate():
	current_heart_rate = randi() % (max_heart_rate - min_heart_rate + 1) + min_heart_rate
	Heart.text = "Heart Rate: " + str(current_heart_rate) + " BPM"
