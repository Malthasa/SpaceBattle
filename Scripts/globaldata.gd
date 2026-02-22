extends Node

var shippos = [Vector2(0,0), Vector2(0,0)]

var hp = [50, 50]
var vel = [Vector2(0,0), Vector2(0,0)]
var p1script = """
extends RefCounted

var e

func run():
	var angle = e.angle_to_enemy()
	if angle < 180 && angle > 0:
		e.leftthruster(0.6)
	elif angle == 0:
		e.leftthruster(1)
		e.rightthruster(1)
		#e.midthruster(1)
		e.shoot()
	else:
		e.rightthruster(0.6)
"""
var p2script = """
extends RefCounted

var e


func run():
	if e.laser_rotation() != 180:
		e.turnlaser(1)
	var angle = e.angle_to_enemy()
	if angle < 180 && angle > 0:
		e.rightthruster(1)
	elif angle == 180:
		e.leftthruster(1)
		e.rightthruster(1)
		e.midthruster(1)
		e.shoot()
	else:
		e.leftthruster(1)
"""

#Ship that follows the Enemy and aims the laser at them
"""
extends RefCounted

var e
var AngleDiff

func run():
	AngleDiff = e.laser_rotation() - e.angle_to_enemy()
	e.turnlaser(-AngleDiff)
	var angle = e.angle_to_enemy()
	if abs(AngleDiff) < 1:
		e.shoot()
	if angle < 180 && angle > 0:
		e.leftthruster(0.6)
	elif angle == 0:
		e.leftthruster(1)
		e.rightthruster(1)
		if e.get_energy() > 800:
			e.midthruster(1)
		
	else:
		e.rightthruster(0.6)
"""

"""
extends RefCounted

var e
var AngleDiff

func run():
	AngleDiff = e.laser_rotation() - e.angle_to_enemy()
	e.turnlaser(-AngleDiff)
	var angle = e.angle_to_enemy()
	if abs(AngleDiff) < 5:
		e.shoot()
	if angle < 180 && angle > 0:
		e.rightthruster(1)
	elif angle == 180:
		e.leftthruster(1)
		e.rightthruster(1)
		e.midthruster(1)
	else:
		e.leftthruster(1)
"""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
