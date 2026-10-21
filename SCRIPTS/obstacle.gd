extends Area2D
var obstacle = randf_range(1,2)
var posiciox = randf_range(1200,1300)
var posicioy = randf_range(355,357)
var escalaR = randf_range(0.8,1.2)

@onready var sprite = $AnimatedSprite2D
@onready var collision1 = $CollisionPolygon2D
@onready var collision2 = $CollisionPolygon2D2

var speed = 400 * Global.velocitat
var posicio : Vector2
var spawner
var pasat = false

func _ready() -> void:
	if Global.MORT == false:
		if obstacle == 1:
			sprite.play("1")
			collision1.disabled = false
			collision2.disabled = true
		else:
			sprite.play("2")
			collision1.disabled = true
			collision2.disabled = false
		posicio = position
		scale.x = escalaR
		scale.y = escalaR

func _process(delta: float) -> void:
	if Global.MORT == false:
		position.x -= speed * delta
	if Global.IA == true:
		if not pasat and position.x < -1070:
			pasat = true
			Global.JUGADOR.obstacle_passat()

func _on_area_entered(area: Area2D) -> void:
	destruir()

func _on_body_entered(body: Node2D) -> void:
	Global.ies_mortes+=1

func destruir():
	spawner.obstacles.erase(self)
	queue_free()
