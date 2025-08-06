class_name MejoraImpulso
extends MejoraTienda
@export var Impulso_extra: Array[int]

func mejora(extra_mejora : int):
	Global.mejoras[nombre] += extra_mejora
	actualziar_mejora()
	precio *= numero_mejoras+1
	
func actualziar_mejora():
	if numero_mejoras < Impulso_extra.size():
		numero_mejoras = Global.mejoras[nombre] 
		Global.player.impulso_base ==Impulso_extra[numero_mejoras]
