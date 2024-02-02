extends CharacterBody2D

signal health_depleted

var shoot_speed : float = 1
var shoot_item : int 
var health = 100.0
var score: int = 0

func _ready():
	SceneSwitcher.game_over = false
	
func _physics_process(delta):
	set_shoot_speed_item()
	
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * 600
	if SceneSwitcher.game_over == false:
		move_and_slide()
	
	if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()

	const DAMAGE_RATE = 100.0	
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	%ProgressBar.value = health	
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
	#	%ProgressBar.value = health
		if health <= 0:
			SceneSwitcher.game_over = true
			health_depleted.emit()  

func get_level():
	var id = SceneSwitcher.level
	if id != null:
		print("Level ID:", id)
	else:
		print("Level ID saknas för denna bana")

func set_shoot_speed_item():
	if shoot_item >= 10:
		shoot_item = 10
	var timer_speed = (11 - shoot_item) * 0.1
	shoot_speed = timer_speed
	SceneSwitcher.shoot_speed = shoot_speed
	### TEST ###
	### print(timer_speed)	
	
	
