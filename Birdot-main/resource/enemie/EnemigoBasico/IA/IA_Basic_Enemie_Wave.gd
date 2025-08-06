class_name IA_Basic_Enemie extends IA

func _move(direccion : Vector2,posicion_original: Vector2,delta:float):
	var direccion_nueva : Vector2
	direccion_nueva = direccion.normalized()
	if frequencia!= 0:
		direccion_nueva.y = (sin(frequencia*Time.get_unix_time_from_system()))*velocidad_frequencia
	direccion_nueva *= velocidad*delta
	direction = direccion_nueva
