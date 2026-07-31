extends RefCounted
class_name QLearning

var q_table = {} 
#la "taula Q"

var alfa = 0.05
var gamma = 0.95
var epsi = 0.99
var dec_epsi = 0.999
var epsi_minim = 0.0005

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
	
	if randf() < epsi:
		accio = randi() % 2
		return accio

	if q_table[estat][NOSALT] > q_table[estat][SALT]:
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
	
	q_table[estat][accio] = q_actual + alfa * (recompensa + gamma*millor_q_seg - q_actual)
	
	#print(epsi)
	#print(estat,"->", q_table[estat])
	
	epsi = max(epsi_minim, epsi * dec_epsi)
	#print(epsi)
func guarda():
	pass
	
func carrega():
	pass
