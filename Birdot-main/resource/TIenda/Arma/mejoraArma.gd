class_name MejroaArma
extends MejoraTienda
@export var Arma_nueva: Array[Resource]

func mejora(extra_mejora: int):
	Global.mejoras[nombre] += extra_mejora
	numero_mejoras += extra_mejora
	actualziar_mejora()
	precio *= numero_mejoras +1
	
func actualziar_mejora():
	if numero_mejoras < Arma_nueva.size():
		numero_mejoras = Global.mejoras[nombre] 
		Global.player.Arma = Arma_nueva[numero_mejoras]
	
