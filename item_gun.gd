extends Area2D

func restart():
	die()

func die():
	queue_free()
	const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
	var smoke = SMOKE_SCENE.instantiate()
	get_parent().add_child(smoke)
	smoke.global_position = global_position	

func _on_body_entered(body):
	body.shoot_item += 1
	die()
