extends Node

var player : RigidBody2D
var dinero: int =40


#mejoras
var arma: int =0
var daño: int=0
var velocidad_impulso: int=0
var salto: int=0

signal aterrizaje

signal enemigo_destruido(enemigo:Area2D)
signal squadra_destruida()

signal actualizar_personaje()
