extends Node2D


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

	if Input.is_action_just_pressed("ESCAPE"):
		get_tree().change_scene_to_file("res://ESCENES/INTERFAZ.tscn")
	if Global.MORT == true:
		#if Input.is_action_just_pressed("ESPAI"):
		if Global.punts > Entrenar.highscore:
			Entrenar.highscore = Global.punts
		print("Highscore: ",Entrenar.highscore)
		reset()

		

func _on_timer_timeout() -> void:
	pass # Replace with function body.

func reset():
	Global.punts = 0

	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file("res://ESCENES/PRINCIPAL_MAPA.tscn")
