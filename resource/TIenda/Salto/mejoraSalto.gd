class_name MejoraSalto
extends MejoraTienda
@export var salto_extra: Array[int]

func mejora():
	numero_mejoras += 1
	actualziar_mejora (numero_mejoras)
	precio *= numero_mejoras
		
func actualziar_mejora(indice_mejora : int):
	if indice_mejora < salto_extra.size():
		Global.arma =indice_mejora
		numero_mejoras = Global.arma
	Global.player.salto =salto_extra[indice_mejora]
