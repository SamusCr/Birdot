class_name bird
extends RigidBody2D


@export var Arma: Weapon
@export var vida : Destruible

@export var impulso_base : int
@export var salto : int
@export var combustible_max : float
@export var combustible_gasto: int

@export  var Bala : PackedScene 
@export var cadencia : Timer

@export var Camera : Camera2D
@export var punto_delante_final: Node2D
@export var punto_delante_final2: Node2D
@export var move_camera_vel : float

var daño_base :int = 1
var can_shoot: bool = true
var limit_superior :bool =false
var posicion_final: Vector2
var vida_actual:int

func _init():
	Global.player = self


func _ready():
	vida_actual = vida.vida
	posicion_final = Camera.position
	Global.actualizar_personaje.emit()

#Faig canviar el la gravetatper a que caiga mes lento. Per detectar quan para li diguem que can_sleep = true
func impulse_bird(ini_force:Vector2):
	gravity_scale = 0.5
	can_sleep = true
	apply_central_impulse( ini_force)
	
func impulso_salto():
	apply_central_impulse(Vector2(impulso_base*salto,-impulso_base*salto)*50)

#Canvis de camara per donar sensacio de moviment
func move_camera():
	if linear_velocity.y > 1 && linear_velocity.x != 0:
		if $AnimatedSprite2D.animation!= "caer":
			$AnimatedSprite2D.global_rotation_degrees = 60
			$AnimatedSprite2D.play("caer")

		if Camera.position.y >= posicion_final.y :
			Camera.position.y -= move_camera_vel*0.5
		if -Camera.position.x >= -posicion_final.x:
			Camera.position.x += move_camera_vel*0.2
		
	elif linear_velocity.y < -1 && linear_velocity.x!= 0:
		if $AnimatedSprite2D.animation!= "Volar":
			$AnimatedSprite2D.play("Volar")
			$AnimatedSprite2D.rotation = 0
		if Camera.position.y <= -punto_delante_final.position.y :
			Camera.position.y += move_camera_vel
		if -Camera.position.x <= punto_delante_final.position.x:
			Camera.position.x -= move_camera_vel

func game_over():
	Camera.reparent(get_parent())
	Global.game_over.emit()
	$AnimatedSprite2D.hide()

#cadenciad e dispar
func _on_cadencia_timeout():
	can_shoot = true

#en el moment que no es mou, es considera que ha aterrat
func _on_sleeping_state_changed():
	Global.aterrizaje.emit()
