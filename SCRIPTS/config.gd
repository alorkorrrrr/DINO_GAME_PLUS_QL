extends Node2D

@onready var poble = $Label_Pob/TextEdit
@onready var velo = $Label_Vel/TextEdit
@onready var alf = $Label_Alfa/TextEdit
@onready var gamm = $Label_Gamma/TextEdit
@onready var eps = $Label_Epsi/TextEdit
@onready var dec = $Label_Deca/TextEdit

func _ready() -> void:
	poble.text = str(Global.poblacio)
	velo.text = str(Global.velocitat)
	alf.text = str(Global.alpha)
	gamm.text = str(Global.gamma)
	eps.text = str(Global.epsil)
	dec.text = str(Global.deca)

func _process(delta: float) -> void:
	if Global.enconfig == true:
		Global.poblacio = int(poble.text)
		Global.velocitat = int(velo.text)
		Global.alpha = float(alf.text)
		Global.gamma = float(gamm.text)
		Global.epsil = float(eps.text)
		Global.deca = float(dec.text)
		
		pass

func _on_tornar_pressed() -> void:
	Global.enconfig = false
	get_tree().change_scene_to_file("res://ESCENES/INTERFAZ.tscn")

func _on_save_pressed() -> void:
	Entrenar.ment.guarda()

func _on_load_pressed() -> void:
	Entrenar.ment.carrega()
