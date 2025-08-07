class_name MejoraSalto
extends MejoraTienda
@export var salto_extra: Array[int]

func mejora(extra_mejora: int)-> bool:
	if numero_mejoras + extra_mejora < salto_extra.size():
		Global.mejoras[nombre] += extra_mejora
		actualziar_mejora()
		return true
	return false
			
func actualziar_mejora():
	if numero_mejoras < salto_extra.size():
		numero_mejoras = Global.mejoras[nombre] 
		Global.player.combustible_max = salto_extra[numero_mejoras]
