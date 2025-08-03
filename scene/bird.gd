class_name bird
extends RigidBody2D


@export var Arma: Weapon

@export var impulso_base : int
@export var salto : int

@export  var dinero: int
@export  var Bala : PackedScene 
@export var vida : Destruible

@export var cadencia : Timer
@export var Camera : Camera2D
@export var punto_delante_final: Node2D
@export var punto_delante_final2: Node2D
@export var Volocidad_subida :float
@export var move_camera_vel : int


var can_shoot: bool = true
var limit_superior :bool =false
var posicion_final: Vector2
var vida_actual:int

func _init():
	Global.player = self
func _ready():
	posicion_final = Camera.position

func impulse_bird(ini_force:Vector2):
	gravity_scale = 0.5
	can_sleep = true
	apply_central_impulse(impulso_base*ini_force)
	
func impulso_salto():
	apply_central_impulse(Vector2(impulso_base*salto,-impulso_base*salto)*1000)

func move_camera():
	if linear_velocity.y > 1 && linear_velocity.x != 0:
		if Camera.position.y >= -punto_delante_final2.position.y :
			Camera.position.y -= move_camera_vel*0.5
		if -Camera.position.x >= punto_delante_final2.position.x:
			Camera.position.x += move_camera_vel*0.2
	elif linear_velocity.y < -1 && linear_velocity.x!= 0:
		if Camera.position.y <= -punto_delante_final.position.y :
			Camera.position.y += move_camera_vel
		if -Camera.position.x <= punto_delante_final.position.x:
			Camera.position.x -= move_camera_vel

func game_over():
	Camera.reparent(get_parent())
	queue_free()
	get_parent().fase_actual = get_parent().fases.GAMEOVER

func _on_cadencia_timeout():
	can_shoot = true


func _on_sleeping_state_changed():
	Global.aterrizaje.emit()
