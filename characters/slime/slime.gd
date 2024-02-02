extends Node2D

@onready var slime_sprite = %SlimeBody

func _ready():
	if SceneSwitcher.level == 1:
		slime_sprite.texture = load("res://characters/slime/slime_body_hurt.png")
	if SceneSwitcher.level == 2:
		slime_sprite.texture = load("res://characters/slime/slime_body_red.png")
	if SceneSwitcher.level == 3:
		slime_sprite.texture = load("res://characters/slime/slime_body_blue.png")
	if SceneSwitcher.level == 4:
		slime_sprite.texture = load("res://characters/slime/slime_body.png")
		#slime_sprite.set_scale(Vector2(2,2))

func play_walk():
	%AnimationPlayer.play("walk")


func play_hurt():
	%AnimationPlayer.play("hurt")
	%AnimationPlayer.queue("walk")
