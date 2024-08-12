extends CharacterBody2D

@export var exp_value = 5

@onready var loot_scene = get_tree().get_first_node_in_group("loot")



var dir = null
var speed = 300
var target = null
var hp = 20
# Get the gravity from the project settings to be synced with RigidBody nodes.
var fear_flag = 1

var exp = preload("res://drops/experience_drop.tscn")

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
		var exp_drop = exp.instantiate()
		exp_drop.position = global_position
		exp_drop.experience = exp_value
		loot_scene.call_deferred("add_child", exp_drop)
		queue_free()
		
func fear(duration):
	fear_flag = -1
	await get_tree().create_timer(duration).timeout
	fear_flag = 1
