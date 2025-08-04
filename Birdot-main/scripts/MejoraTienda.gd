class_name MejoraTienda
extends Resource

@export var precio : int
@export var sprite : Texture
@export var nombre : String

var numero_mejoras: int =0
 
func _init():
	precio *=  numero_mejoras

func mejora(extra_mejora : int):
	pass
	
func actualziar_mejora():
	pass
