extends Node2D

var radius = 100
var num = 0

var speed = 1.0   # Rotation speed in radians per second

var current_angle = 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	var num = self.get_child_count()
	if num == 0:
		return
	
	var unit = TAU / num
	var weapons = self.get_children()
	
	for i in range(num):
		var weapon = weapons[i]
		var rad = unit * i
		var end_pos = Vector2(radius, 0).rotated(rad)
		weapon.position = end_pos
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	current_angle += 2*speed * delta  # Update the rotation angle based on the speed and delta time
	var num = self.get_child_count()
	if num == 0:
		return
	var unit = TAU / num
	var weapons = self.get_children()

	for i in range(num):
		var weapon = weapons[i]
		var rad = unit * i + current_angle  # Add the current angle to the unit angle
		var end_pos = Vector2(radius, 0).rotated(rad)
		weapon.position = end_pos
	pass
