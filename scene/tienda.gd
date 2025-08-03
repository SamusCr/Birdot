extends Control

@export var posibles_mejoras: Array[MejoraTienda]

func _ready():
	Global.actualizar_personaje(posibles_mejoras)


func _on_button_pressed():
	get_tree().reload_current_scene()
