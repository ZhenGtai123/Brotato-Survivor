extends CharacterBody2D

@onready var player1Ani = $AnimatedSprite2D
@onready var play1 = $"."
@export var speed = 700
@onready var direction = Vector2.ZERO
@onready var player_face = Vector2(-1,0)

var dir_lock = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var self_pos = position
	# Get input for movement
	direction = Vector2.ZERO
	
	if Input.is_action_pressed("right"):
		direction.x += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("up"):
		direction.y -= 1
	if Input.is_action_pressed("down"):
		direction.y += 1
	direction = direction.normalized()
	if Input.is_action_pressed("lock"):
		dir_lock = !dir_lock
	#if Input.is_action_just_released("lock"):
		#dir_lock = false
	if !dir_lock: 
		player_face = direction
	velocity = direction * speed;
	move_and_slide()
	if velocity.length() == 0:
		player1Ani.play("default")
	else:
		player1Ani.play("walk")
	if direction.x < 0 and !dir_lock:
		player1Ani.flip_h = false
	elif direction.x > 0 and !dir_lock:
		player1Ani.flip_h = true
	
	pass
