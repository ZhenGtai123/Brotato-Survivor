extends CharacterBody2D

var dir = Vector2(1,0)
var speed = 2000
var damage = 1

# Get the gravity from the project settings to be synced with RigidBody nodes.


func _process(delta):
	
	velocity = dir * speed
	move_and_slide()
	pass
