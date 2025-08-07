extends Control

@export var posibles_mejoras: Array[Casilla_tienda]

#Tenda on comrpar les millores. Pot acutalitzar tota la tenda i el personatge per quan guardem o carguem partida

func _ready():
	Global.actualizar_personaje.connect(actualizar_personaje)
	actualizar_personaje()
	Global.actualizar_diner.emit()

func actualizar_personaje():
	for mejora in posibles_mejoras:
		mejora.actualizar_boton()


func _on_button_pressed():
	get_tree().reload_current_scene()


func _on_boton_guardar_pressed():
	Global.guardar_partida()
	get_tree().quit()
