extends CanvasGroup

@onready var puntuacio = $PUNTUACIO

func _ready() -> void:
	puntuacio.text = "Punts: 0000" + str(Global.punts)
	$Timer.start()
	

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
func _on_timer_timeout() -> void:
	if Global.MORT == false:
		actualitzaPunts()
