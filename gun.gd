extends Area2D

var game_over : bool
var shoot_speed : float 
@onready var  timer = %ShootTimer
	
func _physics_process(_delta):
	shoot_speed = SceneSwitcher.shoot_speed
	timer.wait_time = shoot_speed
	game_over = SceneSwitcher.game_over
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.position)

func shoot():
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %shootingPoint.global_position
	new_bullet.global_rotation = %shootingPoint.global_rotation
	%shootingPoint.add_child(new_bullet)

func _on_timer_timeout():
	if game_over == false:
		shoot()
