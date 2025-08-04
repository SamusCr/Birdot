class_name  Weapon
extends Resource

@export var nombre: String
@export var cadencia: float
@export var velocidad: float


func disparar(Direccion:Vector2, Disparador: Vector2 ,Bala:PackedScene,daño:int)->Node2D:

	var disparo = Bala.instantiate()
	if disparo.is_in_group("bala_enemigo"):
		Global.player.Camera.add_child(disparo)
		disparo.vida_actual = disparo.vida_resource  .vida
	else:
		Global.player.add_child(disparo)
	disparo.global_position = Disparador
	disparo.daño = daño
	disparo.velocidad = velocidad
	disparo.direccion = Direccion -Disparador
	disparo.look_at(Direccion)
	return disparo
	
