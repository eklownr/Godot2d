extends Node2D

func play_idle_animation():
	%AnimationPortal.play("idle")

func play_active_animation():
	%AnimationPortal.play("active")


func _ready():
	pass
	#play_idle_animation()


func restart():
	die()

func die():
	queue_free()
	const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
	var smoke = SMOKE_SCENE.instantiate()
	get_parent().add_child(smoke)
	smoke.global_position = global_position

