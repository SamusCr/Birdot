class_name MejoraBala
extends MejoraTienda
@export var Bala_dano :Array[int]

func mejora(extra_mejora : int):
	Global.mejoras[nombre] += extra_mejora
	actualziar_mejora()
	precio *= numero_mejoras +1

func actualziar_mejora():
	if numero_mejoras < Bala_dano.size():
		numero_mejoras = Global.mejoras[nombre] 
		Global.player.daño_base = Bala_dano[numero_mejoras]
