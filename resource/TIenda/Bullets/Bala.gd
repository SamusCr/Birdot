class_name MejoraBala
extends MejoraTienda
@export var Bala_dano :Array[int]

func mejora():
	numero_mejoras += 1
	actualziar_mejora(numero_mejoras)
	precio *= numero_mejoras

func actualziar_mejora(indice_mejora : int):
	if indice_mejora < Bala_dano.size():
		Global.arma =indice_mejora
		numero_mejoras = Global.arma
	Global.player.Arma.daño = Bala_dano[indice_mejora]
