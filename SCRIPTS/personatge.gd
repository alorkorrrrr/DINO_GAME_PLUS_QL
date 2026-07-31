extends CharacterBody2D

const SPEED = 0
const JUMP_VELOCITY = -750.0
var gravity = (ProjectSettings.get_setting("physics/2d/default_gravity")) * 3

@onready var animacio = $AnimatedSprite2D
@onready var areapeus = $Sprite2D
@onready var colisio = $CollisionPolygon2D

func _ready():
	if Global.IA == false:
		animacio.visible = true
		areapeus.visible = true
		colisio.disabled = false
		Global.JUGADOR = self
		Global.MORT = false
		animacio.play("IDLE")
	else:
		animacio.visible = false
		areapeus.visible = false
		colisio.disabled = true
		
func _physics_process(delta: float) -> void:
	if Global.IA == false:
		if Global.MORT == false:
			if not is_on_floor():
				velocity += get_gravity() * delta
				animacio.play("IDLE")
			else:
				if Input.is_action_just_pressed("ESPAI"):
					salt()
				animacio.play("RUN")
		if Global.MORT == true:
			animacio.play("MORT")
		if Global.MORT == false:
			move_and_slide()

func salt():
	if is_on_floor():
		velocity.y = JUMP_VELOCITY
