extends Node2D
@onready var player = get_tree().get_first_node_in_group("player")
@onready var interval = 0.1
@onready var speed = 2000
@onready var timer = $Timer
@onready var bullet = preload("res://bullet/bullet.tscn")
@onready var fire_position = $fire_position
@onready var vscale =  Vector2(6,6)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var this_bullet = bullet.instantiate()
	this_bullet.speed = speed
	this_bullet.position = fire_position.global_position
	this_bullet.scale = vscale
	print(player.dir.x)
	this_bullet.dir = Vector2(0,player.dir.x)
	get_tree().root.add_child(this_bullet)
	pass # Replace with function body.
