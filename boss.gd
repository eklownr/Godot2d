extends CharacterBody2D
	
### easy to kill on a higher level

@export var health = 30
var speed = 200
@onready var player = get_node("/root/Game/%player")
@onready var win = %won_the_game/win
#@onready var win = get_node("/root/Game/%won_the_game/win")


func _ready():
	# TODO %Boss.play_walk()
	smoke_anim()

func _physics_process(_delta):
	call_deferred("_update_player_direction")
	%bossBar.value = health	

func _update_player_direction():
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()

func take_damage():
	smoke_anim()
	SceneSwitcher.score += 100
	health -= 1
	### %Boss.play_hurt()
	if health <= 0:
		killed_the_boss()
		die()

func die():
	for i in range(0, 10):
		smoke_anim()
	#queue_free()

func smoke_anim():
	const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
	var smoke = SMOKE_SCENE.instantiate()	
	get_parent().add_child.call_deferred(smoke)
	smoke.global_position = global_position

func restart():
	smoke_anim()
	queue_free()

func killed_the_boss():
	# TODO play You have won animation
	win.won_game()
		

