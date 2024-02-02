extends Node2D

### clock test
#var sec2 : int 


@onready var scoreLable := %Score 
@onready var time = %Time
var sec : int = SceneSwitcher.time_sec
@onready var player = %player
@onready var level_id_text = get_node("/root/Game/level_text/%level_id_text")
var level : int

func _ready():
	sec = SceneSwitcher.time_sec
	var id = get_node("level_id").level_id
	level = id
	SceneSwitcher.level = id
	level_id_text.text = str(id)
	%GameOver.visible = false
	SceneSwitcher.game_over = false

func _on_player_health_depleted():
	%GameOver.visible = true	
	%player.health = 0
	SceneSwitcher.game_over = true
	if Input.is_action_just_pressed("enter"):
		# restart the game
		sec = 0
		SceneSwitcher.time_sec = 0
		restart_children()
		SceneSwitcher.score = 0
		SceneSwitcher.game_over = false
		SceneSwitcher.shoot_speed = 1.0
		%player.score = 0
		%player.health = 100
		%player/ProgressBar.value = 100
		%GameOver.visible = false

func restart_children():
	var children = get_children()
	for child in children:	
		if child.has_method("restart"):
			child.restart()

func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)

func spawn_item():
	var new_item = preload("res://item.tscn").instantiate()
	%PathFollowItem.progress_ratio = randf()
	new_item.global_position = %PathFollowItem.global_position
	add_child(new_item)

func spawn_item_gun():
	var new_item = preload("res://item_gun.tscn").instantiate()
	%PathFollowItem.progress_ratio = randf()
	new_item.global_position = %PathFollowItem.global_position
	add_child(new_item)

func spawn_tree():
	var new_tree = preload("res://pine_tree.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_tree.global_position = %PathFollow2D.global_position
	add_child(new_tree)

func _on_timer_timeout():
	scoreLable.text = str(SceneSwitcher.score)	
	spawn_mob()
	spawn_tree()
	var level_text = %level_text
	level_text.visible = false

func _on_timer_item_timeout():
	spawn_item()
	spawn_item_gun()

func _on_clock_timer_timeout():
	sec += 1
	SceneSwitcher.time_sec += 1
	time.text = digital_clock()

#func _process(_delta):
	#sec2 += 1
	#print(digital_clock_test(sec2))
#
#func  digital_clock_test(sec2):
	#if sec2 <= 9: # Antalet sekunder från start
		#return  str("00:0", + sec2)
	#if sec2 <= 59:
		#return str("00:", + sec2)
	#if sec2 >= 60:
		#var minut = sec2 / 60
		#var secund = sec2 % 60
		#if secund <= 9 and minut <= 9: # 09:09
			#return str("0",+ minut, ":", "0", + secund)
		#if minut <= 9: # 09:10
			#return str("0",+ minut, ":", + secund)
		#if minut >= 10 and secund <= 9: # 10:09
			#return str(minut, ":", "0", + secund)
		#if minut > 59: # 1:00:00 ->
			#return  str("Time limit... 01:00:00 ! Total: ", + sec2, " sec")		
		#else: # 10:10 -> 59:59 sec 
			#return str(minut, ":", + secund)
	#else:
		#return  str("Time limit...", + sec2, " sec")


func  digital_clock():
	if sec <= 9: # Antalet sekunder från start
		return  str("00:0", + sec)
	if sec <= 59:
		return str("00:", + sec)
	if sec >= 60:
		var minut = sec / 60
		var secund = sec % 60
		if secund <= 9 and minut <= 9: # 09:09
			return str("0",+ minut, ":", "0", + secund)
		if minut <= 9: # 09:10
			return str("0",+ minut, ":", + secund)
		if minut >= 10 and secund <= 9: # 10:09
			return str(minut, ":", "0", + secund)
		if minut >= 60: # 1:00:00 ->
			return  str("Time limit... 01:00:00 ! Total: ", + sec, " sec")		
		else: # 10:10 -> 59:59 sec 
			return str(minut, ":", + secund)
	else:
		return  str("Time limit...", + sec, " sec")
		
