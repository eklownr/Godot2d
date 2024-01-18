extends Node2D

@onready var scoreLable := %Score 
@onready var player = get_node("/root/Game/player")

func _ready():
	%GameOver.visible = false

func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)

func spawn_tree():
	var new_tree = preload("res://pine_tree.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_tree.global_position = %PathFollow2D.global_position
	add_child(new_tree)
	
func _on_timer_timeout():
	scoreLable.text = str(player.score)	
	spawn_mob()
	spawn_tree()

func _on_player_health_depleted():
	%GameOver.visible = true	
	%player.health = 0	
	#get_tree().paused = true
	if Input.is_action_just_pressed("restart"):
		# kill all mob-ememies
		var children = get_children()
		for child in children:	
			if child.has_method("restart"):
				child.restart()
		%player.score = 0
		%player.health = 100
		%player/ProgressBar.value = 100
		%GameOver.visible = false

func spawn_item():
	var new_item = preload("res://item.tscn").instantiate()
	%PathFollowItem.progress_ratio = randf()
	new_item.global_position = %PathFollowItem.global_position
	add_child(new_item)

func _on_timer_item_timeout():
	spawn_item()
