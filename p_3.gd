extends Area2D

var score = SceneSwitcher.score

func _process(_delta):
	if score <= 1000:
		visible = false
	else:
		visible = true

func _on_body_entered(_body):
	if visible:
		SceneSwitcher.switch_scene("res://game_red.tscn")
