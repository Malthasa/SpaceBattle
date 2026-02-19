extends Node

var script_code

var userscript
var instance

func compile_dynamic_code():
	userscript = GDScript.new()
	userscript.source_code = script_code
	userscript.reload()
	
	# Create instance and inject reference
	instance = RefCounted.new()
	instance.set_script(userscript)
	instance.external_ref = self
	
	#instance.run()
	

func _ready():
	if get_parent().ID == 0:
		script_code = globaldata.p1script
	else:
		script_code = globaldata.p2script
	compile_dynamic_code()

func testscript():
	if angle_to_enemy() < 180 && angle_to_enemy() > 0:
		leftthruster(0.5)
	else:
		rightthruster(0.5)

func update():
	#run_dynamic_code()
	instance.run()
	
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
	
func get_energy():
	get_parent().get_energy()
