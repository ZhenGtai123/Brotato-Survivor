extends Node2D
@onready var timer = $Timer

@onready var mines = preload("res://mines.tscn")
@onready var player = get_tree().get_first_node_in_group("player")
@onready var fire_position = $fire_position
var damage = 10
func _process(delta):
	position = get_tree().get_first_node_in_group("player").global_position.normalized()
	
func _on_timer_timeout():
	
	var this_mine = mines.instantiate()
	this_mine.damage = damage
	this_mine.position = fire_position.global_position
	get_tree().root.add_child(this_mine)
	pass # Replace with function body.
