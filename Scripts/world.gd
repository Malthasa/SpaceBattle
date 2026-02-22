extends Node2D

var camera_id = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Camera2D/Health1.value = globaldata.hp[0]*2
	$Camera2D/Health2.value = globaldata.hp[1]*2
	$Camera2D.position = globaldata.shippos[camera_id]
	$Camera2D/Distance.text = str("Distance between Ships[br]", int(globaldata.shippos[0].distance_to(globaldata.shippos[1])))
	if Input.is_action_just_pressed("ui_right") or Input.is_action_just_pressed("ui_left"):
		camera_id = fmod(camera_id + 1, 2)
	
	
	$Camera2D/BG.material.set_shader_parameter("camera_position", $Camera2D.global_position)
	$Camera2D/BG2.material.set_shader_parameter("camera_position", $Camera2D.global_position)
	$Camera2D/BG3.material.set_shader_parameter("camera_position", $Camera2D.global_position)
	$Camera2D/BG4.material.set_shader_parameter("camera_position", $Camera2D.global_position)
	

var e

func run(): 
	var angle = e.angle_to_enemy()
	var Energy = e.get_energy()

	if Energy < 20:
		if angle > 0:
			e.rightthruster(0.5)
		else:
			e.leftthruster(0.5)
		return
	if abs(angle) < 15:
		e.shoot()
	if angle < 0:
		e.rightthruster(1)
	else:
		e.leftthruster(1)
	e.midthruster(1)
