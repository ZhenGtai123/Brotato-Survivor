extends Area2D
@export var experience = 10
var red = preload("res://drops/assets/gemRed.png")
var green = preload("res://drops/assets/gemGreen.png")
var blue = preload("res://drops/assets/gemBlue.png")
var yellow = preload("res://drops/assets/gemYellow.png")

var target = null 
var speed = 2

@onready var sprite = $Sprite2D
@onready var collision = $CollisionShape2D
@onready var player = get_tree().get_first_node_in_group("player")
@onready var sound = player.get_node("collected")

func _ready():
	if experience <= 10:
		return
	elif experience <= 20:
		sprite.texture = blue
	elif experience <= 50:
		sprite.texture = red
	elif experience <= 100:	
		sprite.texture = yellow
		
func _physics_process(delta):
	if target != null:
		global_position = global_position.move_toward(target.global_position,speed)
		speed+=8*delta
		
func collect():
	sound.play()
	collision.call_deferred("set","disabled",true)
	sprite.visible = false
	return experience


func _on_collected_finished():
	queue_free()
