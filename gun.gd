extends Area2D


func _physics_process(_delta):
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
	shoot()
