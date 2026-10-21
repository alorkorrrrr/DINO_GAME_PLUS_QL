extends Node2D
var num_ies=Global.poblacio

@export var escena_IA : PackedScene	

func _ready() -> void:
	if num_ies == 1:
		pass
	elif num_ies > 1:
		for i in range(1,num_ies):
			genera_dino()

func _process(delta: float) -> void:
	if Global.ies_mortes >= Global.poblacio:
		Global.MORT = true
		Global.ies_mortes = 0

func genera_dino():
	var dino = escena_IA.instantiate()
	add_child(dino)
