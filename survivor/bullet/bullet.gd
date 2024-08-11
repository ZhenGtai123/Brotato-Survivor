extends Area2D
var maxDistance = 4000
var dir = Vector2(1,0)
var speed = 2000
var damage = 10
var distanceTraveled = 0
var distance = 0

func _process(delta):
	distance = speed * delta
	position += dir * distance
	distanceTraveled +=  distance
	if distanceTraveled > maxDistance:
		queue_free()
	
func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage(damage)

	

