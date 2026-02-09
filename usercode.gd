extends Node

var script_code = """
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
"""

func run_dynamic_code():
	var script = GDScript.new()
	script.source_code = script_code
	script.reload()
	
	# Create instance and inject reference
	var instance = RefCounted.new()
	instance.set_script(script)
	instance.external_ref = self
	instance.run()
	

func _ready():
	if get_parent().ID == 0:
		script_code = globaldata.p1script
	else:
		script_code = globaldata.p2script
	#run_dynamic_code()

func testscript():
	if angle_to_enemy() < 180 && angle_to_enemy() > 0:
		leftthruster(0.5)
	else:
		rightthruster(0.5)

func update():
	run_dynamic_code()
	
func leftthruster(power):
	get_parent().leftthruster(power)
	
func rightthruster(power):
	get_parent().rightthruster(power)

func turnlaser(dir):
	get_parent().turnlaser(dir)

func laser_rotation():
	return get_parent().laser_rotation()

func shoot():
	get_parent().shoot()

func angle_to_enemy():
	return get_parent().angle_to_enemy()
	
func midthruster(power):
	get_parent().midthruster(power)
