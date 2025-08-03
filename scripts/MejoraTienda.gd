class_name MejoraTienda
extends Resource

@export var precio : int
@export var sprite : Texture
@export var nombre : String

var numero_mejoras: int =1
 
func _init():
	precio *=  numero_mejoras

func mejora():
	pass
	
func actualziar_mejora(indice_mejora : int):
	pass
