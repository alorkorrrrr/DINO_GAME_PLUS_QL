extends CharacterBody2D

const SPEED = 0
const JUMP_VELOCITY = -750.0
#var gravity = (ProjectSettings.get_setting("physics/2d/default_gravity")) * 3
var POS_X = 0.0

var estat_pre = ""
var accio_pre = QLearning.NOSALT
var mort_proces = false

var recompensa = 1

var decisio = 0.0
var accio_actual = QLearning.NOSALT
var estat_actual = ""

@onready var animacio = $AnimatedSprite2D
@onready var areapeus = $Sprite2D
@onready var colisio = $CollisionPolygon2D
@export var obstacle_spawn : Node2D

func _ready():
	mort_proces = false
	estat_pre = ""
	accio_pre = QLearning.NOSALT

	if Global.IA == true:
		animacio.visible = true
		areapeus.visible = true
		colisio.disabled = false
		Global.JUGADOR = self
		Global.MORT = false
		POS_X = global_position.x
		animacio.play("IDLE")
	else:
		animacio.visible = false
		areapeus.visible = false
		colisio.disabled = true
		
func _physics_process(delta: float) -> void:
	if not Global.IA:
		return
	
	if Global.MORT == true:
		animacio.play("MORT")
		
		if not mort_proces and not estat_pre == "":
			Entrenar.ment.apren(estat_pre, accio_pre, -100, "MORT")
			mort_proces = true
		return

	if not is_on_floor():
		velocity += get_gravity() * delta
		animacio.play("IDLE")
	else:
		animacio.play("RUN")

	decisio += delta
	if decisio >= 0.05:
		decisio = 0.0

		estat_actual = rep_estat()

		if not estat_pre == "":
			recompensa = 0
			Entrenar.ment.apren(estat_pre, accio_pre, recompensa, estat_actual)

		accio_actual = Entrenar.ment.escull_accio(estat_actual)

		estat_pre = estat_actual
		accio_pre = accio_actual
		
	if is_on_floor() and accio_actual == QLearning.SALT:
		salt()
	move_and_slide()
	


func salt():
	velocity.y = JUMP_VELOCITY

func rep_estat():
	var obstacle = obstacle_spawn.seg_obstacle(POS_X)
	
	if obstacle == null:
		return "0,0,1"
	
	var distancia = obstacle.global_position.x - global_position.x
	var distancia_ces = clampi(int(distancia/20), 0, 80)
	
	var vel = 400 * Global.velocitat
	var vel_ces = clampi(int(vel/50), 0, 10)
	
	return "%d,%d,%d" % [
		distancia_ces,
		Global.velocitat,#vel_ces,
		int(is_on_floor())
	]
	#pots canviar vel_ces amb Global.velocitat

func obstacle_passat():
	Entrenar.ment.apren(estat_pre, accio_pre, Global.reco, rep_estat())


func _on_area_2d_area_entered(area: Area2D) -> void:
	if Global.poblacio > 1:
		queue_free()
