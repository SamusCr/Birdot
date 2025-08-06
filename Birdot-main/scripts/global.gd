extends Node

var player : RigidBody2D

var enemigos_abatidos: int =0


#mejoras
var mejoras : Dictionary = {"MEJORA_ARMA": 0,"MEJORA_DANO":0,"MEJORA_IMPULSO":0,"MEJORA_SALTO":0,"DINERO":40}

var path_save: String= "user://save_data.data"

signal aterrizaje

signal enemigo_destruido(enemigo:Area2D)
signal squadra_destruida()
signal destruir_spawner()
signal empezar_spawnear()

signal actualizar_personaje()
signal actualizar_diner()
signal game_over()

func guardar_partida():
	var datos_JSON = JSON.stringify(mejoras)
	var file = FileAccess.open(path_save,FileAccess.WRITE)
	file.store_string(datos_JSON)
	
func cargar_partida()->bool:
	if not FileAccess.file_exists(path_save):
		print("Error: no hay datos guardados")
		return false
	var file = FileAccess.open(path_save, FileAccess.READ)
	mejoras = JSON.parse_string(file.get_as_text())
	return true
	
func reiniciar_partida():
	for mejora in mejoras:
		mejoras[mejora] = 0
		
		
