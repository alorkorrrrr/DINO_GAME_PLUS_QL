extends Area2D

var posiciox = randf_range(1200,1300)
var posicioy = randf_range(355,357)

@onready var animacio = $AnimatedSprite2D
var velocitat = 400

func _process(delta: float) -> void:
	if Global.MORT == false:
		if Global.PTERO == true:
			position.x -= velocitat * delta
			animacio.play("FLYING")

#func _on_area_entered(area: Area2D) -> void:
#	position = posicio
#	position.x += randf_range(-25,25)

func _on_body_entered(body: Node2D) -> void:
	if Global.PTERO == true:
		Global.MORT = true
