extends Node2D
@export var escena_obstacle : PackedScene	
@onready var timer = $Timer

var obstacles = []

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	if Global.MORT == false:
		genera_obstacle()
		
		timer.wait_time += randf_range(-0.2,0.2)
		if timer.wait_time < 0.9:
			timer.wait_time = 0.9
		if timer.wait_time > 1.5:
			timer.wait_time = 1.5

func genera_obstacle():
	var obstacle = escena_obstacle.instantiate()
	add_child(obstacle)
	obstacle.spawner=self
	obstacles.append(obstacle)

func seg_obstacle(pos_x):
	var prop = null
	var dis_prop = INF
	
	for obstacle in obstacles:
		var distancia = obstacle.global_position.x - pos_x
		
		if distancia < dis_prop and distancia >= 0:
			prop = obstacle
			dis_prop  = distancia
	return prop
