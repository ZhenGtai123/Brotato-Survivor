extends Node2D
@onready var player = get_tree().get_first_node_in_group("player")
@onready var interval = 0.1
@onready var speed = 2000
@onready var timer = $Timer
@onready var bullet = preload("res://bullet/bullet.tscn")
@onready var dead_shot = preload("res://weapon/dead_shot.tscn")
@onready var fire_position = $fire_position
@onready var vscale =  Vector2(6,6)
@onready var player_dir = Vector2(1,0)
var last_dir = Vector2(-1,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player.direction.x* player_dir.x< 0:
		player_dir.x*=-1
	if player.player_face != Vector2(0,0):
		last_dir = player.player_face


func _on_timer_timeout():
	var this_bullet = bullet.instantiate()
	this_bullet.speed = speed
	this_bullet.position = fire_position.global_position
	this_bullet.scale = vscale
	this_bullet.dir = last_dir

	
	
	get_tree().root.add_child(this_bullet)
	var this_dead_shot = dead_shot.instantiate()
	this_dead_shot.position = fire_position.global_position
	get_tree().root.add_child(this_dead_shot)
	pass # Replace with function body.
