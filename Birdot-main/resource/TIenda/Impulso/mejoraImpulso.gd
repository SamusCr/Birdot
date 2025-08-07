class_name MejoraImpulso
extends MejoraTienda
@export var Impulso_extra: Array[int]

func mejora(extra_mejora: int)-> bool:
	if numero_mejoras + extra_mejora< Impulso_extra.size():
		Global.mejoras[nombre] += extra_mejora
		actualziar_mejora()
		return true
	return false
	
func actualziar_mejora():
	if numero_mejoras < Impulso_extra.size():
		numero_mejoras = Global.mejoras[nombre] 
		Global.player.impulso_base ==Impulso_extra[numero_mejoras]
