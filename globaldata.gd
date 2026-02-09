extends Node

var shippos = [Vector2(0,0), Vector2(0,0)]

var hp = [100, 100]
var vel = [Vector2(0,0), Vector2(0,0)]
var p1script = """
extends RefCounted

var external_ref

func run():
	var angle = external_ref.angle_to_enemy()
	if angle < 180 && angle > 0:
		external_ref.leftthruster(0.6)
	elif angle == 0:
		external_ref.leftthruster(1)
		external_ref.rightthruster(1)
		external_ref.midthruster(1)
		external_ref.shoot()
	else:
		external_ref.rightthruster(0.6)
"""
var p2script = """
extends RefCounted

var external_ref

func run():
	if external_ref.laser_rotation() != 180:
		external_ref.turnlaser(1)
	var angle = external_ref.angle_to_enemy()
	if angle < 180 && angle > 0:
		external_ref.rightthruster(1)
	elif angle == 180:
		external_ref.leftthruster(1)
		external_ref.rightthruster(1)
		external_ref.midthruster(1)
		external_ref.shoot()
	else:
		external_ref.leftthruster(1)
"""

"""
extends RefCounted

var external_ref

func run():
	if Input.is_action_pressed("leftt"):
		external_ref.leftthruster(1)
	if Input.is_action_pressed("rightt"):
		external_ref.rightthruster(1)
	if Input.is_action_pressed("laserleft"):
		external_ref.turnlaser(-1)
	if Input.is_action_pressed("laserright"):
		external_ref.turnlaser(1)
	if Input.is_action_pressed("ui_accept"):
		external_ref.shoot()
"""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
