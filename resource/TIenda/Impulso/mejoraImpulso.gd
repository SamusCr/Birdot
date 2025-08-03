class_name MejoraImpulso
extends MejoraTienda
@export var Impulso_extra: Array[int]

func mejora():
	numero_mejoras += 1
	actualziar_mejora(numero_mejoras)
	precio *= numero_mejoras
	
func actualziar_mejora(indice_mejora : int):
	if indice_mejora < Impulso_extra.size():
		Global.arma =indice_mejora
		numero_mejoras = Global.arma
	Global.player.impulso_base ==Impulso_extra[indice_mejora]
