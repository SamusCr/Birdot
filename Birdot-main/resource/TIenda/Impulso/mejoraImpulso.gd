class_name MejoraImpulso
extends MejoraTienda
@export var Impulso_extra: Array[int]

func mejora(extra_mejora : int):
	numero_mejoras += extra_mejora
	actualziar_mejora()
	precio *= numero_mejoras
	
func actualziar_mejora():
	if numero_mejoras < Impulso_extra.size():
		Global.arma =numero_mejoras
		Global.player.impulso_base ==Impulso_extra[numero_mejoras]
