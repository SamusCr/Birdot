class_name MejoraBala
extends MejoraTienda
@export var Bala_dano :Array[int]

func mejora(extra_mejora : int):
	numero_mejoras += extra_mejora
	actualziar_mejora()
	precio *= numero_mejoras

func actualziar_mejora():
	if numero_mejoras < Bala_dano.size():
		Global.arma =numero_mejoras
		Global.player.daño_base = Bala_dano[numero_mejoras]
