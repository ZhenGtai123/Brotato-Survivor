extends Node2D

@onready var interval = 0.25
@onready var speed = 2000
@onready var timer = $Timer
@onready var bullet = preload("res://bullet/bullet.tscn")
@onready var damage = 1
@onready var fire_position = $fire_position
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var this_bullet = bullet.instantiate()
	this_bullet.speed = speed
	this_bullet.damage = damage 
	this_bullet.position = fire_position.global_position
	this_bullet.dir = Vector2(1,0)
	get_tree().root.add_child(this_bullet)
	pass # Replace with function body.
