extends Area2D


func _on_body_entered(_body):
	SceneSwitcher.switch_scene("res://game_purple.tscn")
	
