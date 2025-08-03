class_name IA_Basic_Enemie extends IA

func _move(direccion : Vector2,posicion_original: Vector2):
	var direccion_nueva : Vector2
	direccion_nueva = direccion
	direccion_nueva.y -= (sin(frequencia*Time.get_unix_time_from_system())*vel_frequencia )
	direction = direccion_nueva
