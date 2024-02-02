extends Area2D

#@export var next_scene = PackedScene

func _on_body_entered(_body):
	SceneSwitcher.switch_scene("res://suvivers_game.tscn")
	
