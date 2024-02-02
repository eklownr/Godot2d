extends Control

var new_pause_state = false

func _ready():
	visible = false

func won_game():
	new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	visible = new_pause_state

func _on_button_pressed():
		get_tree().quit()
