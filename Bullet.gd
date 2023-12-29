extends Area2D

var travelled_distance = 0
@export var speed = 1000

func _physics_process(delta):	
	const RANGE = 1200
	var direction = Vector2.RIGHT.rotated(rotation)
	
	position += direction * delta * speed
	travelled_distance += delta * speed
	
	if travelled_distance > RANGE:
		queue_free()


func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
	
