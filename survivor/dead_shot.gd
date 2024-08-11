extends Area2D
var maxDistance = 4000
var speed = 4000
var damage = 20
@onready var player = get_tree().get_first_node_in_group("player")


var dir = null
# Get the gravity from the project settings to be synced with RigidBody nodes.
var distanceTraveled = 0
var distance = 0

func _process(delta):
	if dir == null:
		dir = (player.global_position - self.global_position).normalized()
	distance = speed * delta
	distanceTraveled +=  distance
	position += dir * speed * delta
	
	if distanceTraveled > maxDistance:
		queue_free()
	
func _on_body_entered(body):
	
	if body.has_method("take_damage"):
		body.take_damage(damage)
	dir = -(player.global_position - self.global_position).normalized()
	if body.has_method("fear"):
		body.fear(1)
	
	
