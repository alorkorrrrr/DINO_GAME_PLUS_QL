extends RefCounted
class_name QLearning

var q_table = {} 
#la "taula Q"

var alfa = Global.alpha
var gamma2 = Global.gamma
var epsi = Global.epsil
var dec_epsi = Global.deca
var epsi_minim = 0.001

const NOSALT = 0
const SALT = 1
const accions = [NOSALT,SALT]

var act : int

func escull_accio(estat):
	if q_table.has(estat) and estat.ends_with(",1"):
		print(estat, ":", q_table[estat])

	if not q_table.has(estat):
		q_table[estat] = [0.0,0.0]
		print("Nou estat:", estat)
	
	var accio
	
	if randf() < Global.epsil:
		accio = randi() % 2
		return accio

	if q_table[estat][NOSALT] >= q_table[estat][SALT]:
		accio = NOSALT
	else:
		accio =  SALT
	#print("Estat: ",estat," Accio: ",accio)
	print(estat, ":", q_table[estat])
	return accio
	
	#act = randf_range(0,30)
	#if act>1:
	#	return NOSALT
	#else:
	#	return SALT

func apren(estat, accio, recompensa, seg_estat):
	if not q_table.has(seg_estat):
		q_table[seg_estat] = [0.0,0.0]
		
	var q_actual = q_table[estat][accio]
	var millor_q_seg = max(q_table[seg_estat][NOSALT], q_table[seg_estat][SALT])
	
	q_table[estat][accio] = q_actual + Global.alpha * (recompensa + Global.gamma*millor_q_seg - q_actual)
	
	#print(epsi)
	#print(estat,"->", q_table[estat])
	
	Global.epsil = max(epsi_minim, Global.epsil * Global.deca)
	#print(epsi)

func guarda():
	var fitxer = FileAccess.open("user://q_table.json", FileAccess.WRITE)
	fitxer.store_string(JSON.stringify(q_table))
	fitxer.close()

func carrega():
	var fitxer = FileAccess.open("user://q_table.json", FileAccess.READ)
	
	if fitxer == null:
		return
	
	var dades= JSON.parse_string(fitxer.get_as_text())
	fitxer.close()
	
	if dades is Dictionary:
		q_table = dades
