extends CharacterBody2D

var dir = null
var speed = 1
var target = null

# Get the gravity from the project settings to be synced with RigidBody nodes.



func _ready():
	target = get_tree().get_first_node_in_group("player")
	pass
	
func _process(delta):
	if target:
		dir = target.global_position - self.global_position
		velocity = dir * speed
		move_and_slide()
	pass
