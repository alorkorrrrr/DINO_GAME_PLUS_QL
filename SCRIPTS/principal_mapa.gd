extends Node2D

var reseted = false

func _ready() -> void:
	reseted = false

func _process(delta: float) -> void:
	pass

	if Input.is_action_just_pressed("ESCAPE"):
		get_tree().change_scene_to_file("res://ESCENES/INTERFAZ.tscn")

	if Global.MORT == true:
		#if Input.is_action_just_pressed("ESPAI"):

		reset()

func _on_timer_timeout() -> void:
	pass # Replace with function body.

func reset():
	
	if reseted:
		return
	reseted = true

	if Global.punts > Entrenar.highscore:
		Entrenar.highscore = Global.punts
	print("Highscore: ",Entrenar.highscore)
	
	get_tree().change_scene_to_file("res://ESCENES/PRINCIPAL_MAPA.tscn")
	
	Global.punts = 0
	reseted = false
