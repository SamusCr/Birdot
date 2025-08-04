class_name MejroaArma
extends MejoraTienda
@export var Arma_nueva: Array[Resource]

func mejora(extra_mejora: int):
	numero_mejoras += extra_mejora
	actualziar_mejora()
	precio *= numero_mejoras
	
func actualziar_mejora():
	if numero_mejoras < Arma_nueva.size():
		Global.arma =numero_mejoras
		Global.player.Arma = Arma_nueva[numero_mejoras]
	
