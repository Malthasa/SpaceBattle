extends Node2D

var camera_id = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Camera2D/HealthBG1/Health.size.x = globaldata.hp[0]*2
	$Camera2D/HealthBG2/Health.size.x = globaldata.hp[1]*2
	$Camera2D.position = globaldata.shippos[camera_id]
	if Input.is_action_just_pressed("ui_right"):
		camera_id = fmod(camera_id + 1, 2)
	
	$Camera2D/BG.material.set_shader_parameter("camera_position", $Camera2D.global_position)
	
