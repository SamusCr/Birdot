
class_name Destruible
extends Resource

@export var vida : int


func damage(daño: int, object):
	object.vida_actual -= daño
	if object.is_in_group("jugador"):
		object.get_parent().UI.quitar_vida(daño)
	if object.vida_actual  <= 0:
		if object.is_in_group("enemigo"):
			Global.mejoras["DINERO"] += object.ia_enemie.Recompensa
			Global.actualizar_diner.emit()
			Global.enemigo_destruido.emit(object)
		if object.is_in_group("jugador"):
			object.game_over()
		else:
			object.queue_free()
	#else:
		#object.queue_free()
