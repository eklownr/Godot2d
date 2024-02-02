extends Control
@onready var button = %Button

func _ready():
	visible = false

func _input(event):
	if event.is_action_pressed("esc"):
		var new_pause_state = not get_tree().paused
		get_tree().paused = new_pause_state
		visible = new_pause_state

func _on_button_pressed():
		get_tree().quit()
