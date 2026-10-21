extends Area2D

var velocitat = 400 * Global.velocitat
var posicio = 550

func _process(delta: float) -> void:
	if Global.MORT == false:
		position.x -= velocitat * delta

func _on_area_entered(area: Area2D) -> void:
	position.x = posicio
