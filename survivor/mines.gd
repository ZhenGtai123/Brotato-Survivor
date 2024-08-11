extends Area2D
var dir = Vector2(0,0)
var damage = 10

func _on_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)
	queue_free()

