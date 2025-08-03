extends Node

var player : RigidBody2D
var dinero: int


#mejoras
var arma: int =0
var daño: int=0
var velocidad_impulso: int=0
var salto: int=0

signal aterrizaje

signal enemigo_destruido(enemigo:Area2D)
signal squadra_destruida()

#Esto es una xusta, si tingeura mes temps ho milloraba
func actualizar_personaje(posibles_mejoras: Array[MejoraTienda]):
	for mejora in posibles_mejoras:
		if mejora.is_class("MejroaArma"):
			mejora.numero_mejoras = arma
		elif mejora.is_class("MejoraImpulso"):
			mejora.numero_mejoras = velocidad_impulso
		elif mejora.is_class("MejoraSalto"):
			mejora.numero_mejoras = salto
		elif mejora.is_class("MejoraBala"):
			mejora.numero_mejoras = daño
