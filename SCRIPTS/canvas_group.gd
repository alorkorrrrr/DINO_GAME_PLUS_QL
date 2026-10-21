extends CanvasGroup

@onready var puntuacio = $PUNTUACIO
@onready var puntsmax = $MAX

func _ready() -> void:
	puntuacio.text = "Punts: 0000" + str(Global.punts)
	puntsmax.text = "HIGHSCORE: " + str(Entrenar.highscore)

func _process(delta: float) -> void:
	actualitzaPunts()
func actualitzaPunts():
	if Global.MORT == false:
		Global.punts += 1
		if Global.punts > 10000:
			puntuacio.text = "Punts: " + str(Global.punts)
		elif Global.punts > 1000:
			puntuacio.text = "Punts: 0" + str(Global.punts)
		elif Global.punts > 100:
			puntuacio.text = "Punts: 00" + str(Global.punts)
		elif Global.punts > 10:
			puntuacio.text = "Punts: 000" + str(Global.punts)
		else:
			puntuacio.text = "Punts: 0000" + str(Global.punts)
