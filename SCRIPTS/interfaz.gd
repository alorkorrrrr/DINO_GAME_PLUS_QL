extends Node2D

func _process(delta: float) -> void:
	pass

func _on_jugar_pressed() -> void:
	Global.punts = 0
	get_tree().change_scene_to_file("res://ESCENES/PRINCIPAL_MAPA.tscn")

func _on_sortir_pressed() -> void:
	get_tree().quit()

func _on_ia_config_pressed() -> void:
	get_tree().change_scene_to_file("res://ESCENES//config.tscn")
