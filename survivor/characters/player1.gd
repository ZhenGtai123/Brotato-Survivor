extends CharacterBody2D

@onready var player1Ani = $AnimatedSprite2D
@onready var play1 = $"."
var dir = Vector2.ZERO
@export var speed = 700
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var self_pos = position
	# Get input for movement
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("right"):
		direction.x += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("up"):
		direction.y -= 1
	if Input.is_action_pressed("down"):
		direction.y += 1
	direction = direction.normalized()
	
	velocity = direction * speed;
	move_and_slide()
	if velocity.length() == 0:
		player1Ani.play("default")
	else:
		player1Ani.play("walk")
		
	if direction.x < 0:
		player1Ani.flip_h = true
	elif direction.x > 0:
		player1Ani.flip_h = false
	
	pass
