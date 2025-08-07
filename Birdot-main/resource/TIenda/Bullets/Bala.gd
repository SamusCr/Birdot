class_name MejoraBala
extends MejoraTienda
@export var Bala_dano :Array[int]

func mejora(extra_mejora: int)-> bool:
	if numero_mejoras + extra_mejora < Bala_dano.size():
		Global.mejoras[nombre] += extra_mejora
		actualziar_mejora()
		return true
	return false

func actualziar_mejora():
	if numero_mejoras < Bala_dano.size():
		numero_mejoras = Global.mejoras[nombre] 
		Global.player.Arma.bullet.daño = Bala_dano[numero_mejoras]
