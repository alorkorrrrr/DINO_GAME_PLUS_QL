extends Node2D

@export var escena_ptero : PackedScene	
@onready var timer = $Timer

func _ready() -> void:
	pass # Replace with function body.
	position.y = 325
	
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	if Global.PTERO == true:
		if Global.MORT == false:
			var pterosaure = escena_ptero.instantiate()
			add_child(pterosaure)
	
			timer.wait_time += randf_range(-0.5,0.5)
			if timer.wait_time < 10:
				timer.wait_time = 10
			if timer.wait_time > 15:
				timer.wait_time = 15
