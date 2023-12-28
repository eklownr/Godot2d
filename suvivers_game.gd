extends Node2D


func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)

 
func _on_timer_timeout():
	spawn_mob()


func _on_player_health_depleted():
	%GameOver.visible = true
	#get_tree().paused = true
	if Input.is_action_just_pressed("restart"):
		# kill all mob-ememies
		var children = get_children()
		for child in children:	
			if child.has_method("take_damage"):
				for i in 6: 
					child.take_damage()
		
		%player.health = 100
		%player/ProgressBar.value = 100
		%GameOver.visible = false


#func _on_player_health_depleted():
	#$GameOver.visible = true
	#if Input.is_action_just_pressed("restart"):
		#for i in range(get_child_count()):
			#var child = get_child(i)
			#remove_child(child)
			
			#$player.health = 100
			#$GameOver.visible = false
		
		

