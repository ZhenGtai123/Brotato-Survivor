extends CharacterBody2D

@onready var player1Ani = $AnimatedSprite2D
@onready var play1 = $"."
@export var speed = 700
@onready var direction = Vector2.ZERO
@onready var player_face = Vector2(-1,0)


@onready var exp_bar = get_node("GUI/GUI/ExperienceBar")
@onready var label_level = get_node("GUI/GUI/ExperienceBar/LabelLevel")  



var dir_lock = false
# Called when the node enters the scene tree for the first time.
func _ready():
	set_exp_bar(experience, calculate_experience_cap())
	pass # Replace with function body.


var experience = 0
var player_level = 1
var collected_experience = 0




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


func _on_grab_area_area_entered(area):
	if area.is_in_group("loot"):
		area.target = self

func _on_collect_area_area_entered(area):
	if area.is_in_group("loot"):
		var experience = area.collect()
		calculate_experience(experience)
		
func calculate_experience(exp):
	var exp_required = calculate_experience_cap()
	collected_experience += exp
	if(experience + collected_experience) >= exp_required:
		collected_experience -= exp_required - experience
		player_level += 1
		label_level.text = str("Level " , player_level)
		experience = 0
		exp_required = calculate_experience_cap()
		calculate_experience(0)
	else: 
		experience += collected_experience
		collected_experience = 0
	set_exp_bar(experience, exp_required)
	
func calculate_experience_cap():
	var exp_cap = player_level
	if player_level < 20:
		exp_cap = player_level + 50
	elif player_level < 40:
		exp_cap = 95 * (player_level-19) * 8
	else:
		exp_cap = 255 + (player_level-39) * 12
	return exp_cap
#func levelup():
	#sndLevelUp.play()
	#lblLevel


func set_exp_bar(set_value = 1, set_max_value = 100):
	exp_bar.value = set_value
	exp_bar.max_value = set_max_value
	
