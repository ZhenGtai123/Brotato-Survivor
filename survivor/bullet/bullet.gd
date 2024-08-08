extends Area2D

var dir = Vector2(1,0)
var speed = 2000
var damage = 10

# Get the gravity from the project settings to be synced with RigidBody nodes.


func _physics_process(delta):
	
	position += dir * speed

	
func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage(damage)
