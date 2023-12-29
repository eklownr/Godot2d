extends Area2D

var health = 5
@onready var player = get_node("/root/Game/player")
#@onready var gun = get_node("/root/Game/player/Gun")

func _ready():
	#%Hart.play_idle()
	pass
	
	  
func _physics_process(_delta):
	pass
	
func take_damage():
	health -= 1
	if health < 0:
		die()

func die():
	queue_free()
	const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
	var smoke = SMOKE_SCENE.instantiate()
	get_parent().add_child(smoke)
	smoke.global_position = global_position

func _on_body_entered(body):
	body.health = 100
	#gun.ShootTimer.wait_time = 0.1
	die()
