class_name Enemigo_Arma_IA extends IA

@export var weapon:Resource
var Bala : PackedScene = preload("res://scene/Balas/bullet_enemie.tscn")
var can_shoot : bool =true

func _move(direccion: Vector2,posicion_original: Vector2,delta:float):
	var direccion_nueva : Vector2
	direccion_nueva = direccion.normalized()
	if frequencia!= 0:
		direccion_nueva.y = (sin(frequencia*Time.get_unix_time_from_system()))*velocidad_frequencia
	direccion_nueva.x = 0
	direction = direccion_nueva
	
func atacar(direccion: Vector2,posicion_original: Vector2):
	if Global.player !=null:
		weapon.disparar( Global.player.global_position, posicion_original , Bala,daño_base)
