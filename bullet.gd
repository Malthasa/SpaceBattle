extends RigidBody2D

var timer = 0
var ID
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#set_collision_mask_value(ID+1, true)
	#set_collision_layer_value(ID+1, true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer += delta
	if timer >= 5:
		queue_free()
