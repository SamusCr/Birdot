extends Control

@export var posibles_mejoras: Array[MejoraTienda]

func _ready():
	Global.actualizar_personaje.connect(actualizar_personaje)
	actualizar_personaje()


func _on_button_pressed():
	get_tree().reload_current_scene()

func actualizar_personaje():
	for mejora in posibles_mejoras:
		if mejora.is_class("MejroaArma"):
			Global.arma = mejora.numero_mejoras 
		elif mejora.is_class("MejoraImpulso"):
			Global.velocidad_impulso = mejora.numero_mejoras 
		elif mejora.is_class("MejoraSalto"):
			Global.salto = mejora.numero_mejoras
		elif mejora.is_class("MejoraBala"):
			Global.daño = mejora.numero_mejoras 
		mejora.actualziar_mejora()
