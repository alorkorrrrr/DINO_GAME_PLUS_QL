extends Node2D
@export var escena_nuvol : PackedScene	
@onready var timer = $Timer

func _ready() -> void:
	position.y = randf_range(50,250)
	var nuvol = escena_nuvol.instantiate()
	add_child(nuvol)
	
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	if Global.MORT == false:
		position.y = randf_range(50,250)

		var nuvol = escena_nuvol.instantiate()
		add_child(nuvol)

		timer.wait_time += randf_range(-0.5,0.5)
		if timer.wait_time < 15:
			timer.wait_time = 15
		if timer.wait_time > 20:
			timer.wait_time = 20
