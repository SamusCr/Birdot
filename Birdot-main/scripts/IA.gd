class_name IA

extends Resource

@export var sprite :Texture
@export var nombre : String
@export var daño_base : int
@export var Recompensa : int


@export var velocidad : float
@export var velocidad_frequencia: float
@export var frequencia :float


#Recurs d'on hereden els recursos de la IA dels enemics. 
#Es creara un altre script per detallar mes el seu comprtament

var direction :Vector2


func _move(direccion: Vector2,posicion_original: Vector2,delta:float):
	pass
