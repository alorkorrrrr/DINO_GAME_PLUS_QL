extends Area2D

var posicioy = randf_range(400,500)
var escalaR = randf_range(1,1)

var velocitat = randf_range(70,90)

func _ready() -> void:
	queue_free()

func _process(delta: float) -> void:
	if Global.MORT == false:
		position.x -= velocitat * delta


func _on_area_entered(area: Area2D) -> void:
	destruir() 
	
func destruir():
	queue_free()
