extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var rotation_vel = 0.0
var bullet = preload("res://bullet.tscn")
@export var ID: int
@onready var g = globaldata
var eid

func _ready() -> void:
	if ID == 0:
		eid = 1
	else:
		eid = 0
	set_collision_layer_value(ID+1, false)
	set_collision_mask_value(ID+1, false)

func _physics_process(delta: float) -> void:
	# Call Function to run the user-generated script
	$CodeObject.update()
	
	rotation_degrees += rotation_vel * delta
	velocity.x = lerp(velocity.x, 0.0, 0.01)
	velocity.y = lerp(velocity.y, 0.0, 0.01)
	rotation_vel = lerp(rotation_vel, 0.0, 0.02)
	
	if g.hp[ID] <= 0:
		queue_free()
	
	# Update Position in the Singleton
	g.shippos[ID] = position
	g.vel[ID] = velocity
	# Move object using Physics Engineb
	move_and_slide()


# Get angle to enemy based on the players Rotation
func angle_to_enemy():
	var d = g.shippos[eid] - position
	var angle_to_target = atan2(d.y, d.x)
	
	var relative_angle = angle_to_target - rotation
	
	while relative_angle > PI:
		relative_angle -= 2 * PI
	while relative_angle < - PI:
		relative_angle += 2 * PI
	return floor(fmod(rad_to_deg(relative_angle) + 90, 360))

# Get distance to enemy
func dist_to_enemy():
	return position.distance_to(g.shippos[eid])
	

func midthruster(power):
	if power > 1:
		print("Warning: Invalid Power on the middle thruster")
		return
	$"Middle Thruster".emitting = true
	velocity += Vector2(0,-5*power).rotated(rotation)

func leftthruster(power):
	if power > 1:
		print("Warning: Invalid Power on the left thruster")
		return
	$"Left Thruster".emitting = true
	rotation_vel += 5*power
	velocity += Vector2(0,-2*power).rotated(rotation)

func rightthruster(power):
	if power > 1:
		print("Warning: Invalid Power on the left thruster")
		return
	$"Right Thruster".emitting = true
	rotation_vel -= 5*power
	velocity += Vector2(0,-2*power).rotated(rotation)

func laser_rotation():
	return floor(fmod($Laser.rotation_degrees, 360))

func turnlaser(dir):
	if dir <= 0:
		$Laser.rotate(deg_to_rad(-1))
	elif dir >= 0:
		$Laser.rotate(deg_to_rad(1))
	else:
		print("Warning: Invalid Laser Rotation")
		return

func shoot():
	var b = bullet.instantiate()
	b.position = position + Vector2(0,-40).rotated(rotation + $Laser.rotation)
	b.linear_velocity = Vector2(0,-150).rotated(rotation + $Laser.rotation) + velocity * 1.3
	b.rotation = rotation + $Laser.rotation
	b.ID = ID
	
	get_parent().add_child(b)

func _on_area_2d_area_entered(area: Area2D) -> void:
	var b = area.get_parent()
	if !b.is_in_group("Objects") && b.ID != ID:
		b.queue_free()
		#g.hp[ID] -= 1
