class_name Squadron
extends Node2D

@export var objectivo : RigidBody2D
@export  var enemies : Array[Area2D]
@export var time_spawn : int
var num_enemie = 0

func _ready():
	for n in get_children():
		enemies.append(n)
	Global.enemigo_destruido.connect(destruir_enemigo)


func spawn():
	for n in enemies:
		n.reparent(get_parent())
		n.localitzar_objectivo(Global.player)

func destruir_enemigo(enemie :Area2D):
	enemies.erase(enemie)
	enemie.eliminado()
	if enemies.size() ==0:
		Global.squadra_destruida.emit()
		queue_free()
