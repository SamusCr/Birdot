class_name MejroaArma
extends MejoraTienda
@export var Arma_nueva: Array[Resource]

func mejora():
	numero_mejoras += 1
	actualziar_mejora(numero_mejoras)
	precio *= numero_mejoras
	
func actualziar_mejora(indice_mejora : int):
	if indice_mejora < Arma_nueva.size():
		Global.arma =indice_mejora
		numero_mejoras = Global.arma
	Global.player.Arma = Arma_nueva[indice_mejora]
	
