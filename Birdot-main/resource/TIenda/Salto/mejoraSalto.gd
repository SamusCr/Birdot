class_name MejoraSalto
extends MejoraTienda
@export var salto_extra: Array[int]

func mejora(extra_mejora:int):
	numero_mejoras += extra_mejora
	actualziar_mejora ()
	precio *= numero_mejoras
		
func actualziar_mejora():
	if numero_mejoras < salto_extra.size():
		Global.arma =numero_mejoras
		Global.player.salto =salto_extra[numero_mejoras]
