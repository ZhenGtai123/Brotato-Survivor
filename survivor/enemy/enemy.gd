extends CharacterBody2D

var dir = null
var speed = 300
var target = null
var hp = 100
# Get the gravity from the project settings to be synced with RigidBody nodes.
var fear_flag = 1


func _ready():
	target = get_tree().get_first_node_in_group("player")
	pass
	
func _process(delta):
	if target:
		dir = (target.global_position - self.global_position).normalized()
		velocity = dir * speed * fear_flag
		move_and_slide()
	pass
	
func take_damage(damage):
	hp -= damage
	if hp <= 0:
		queue_free()
		
func fear(duration):
	fear_flag = -1
	await get_tree().create_timer(duration).timeout
	fear_flag = 1
