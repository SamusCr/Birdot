extends Node2D
#control del joc

@export var potencia_disparo_bar : TextureProgressBar

@export var fase_actual:fases
@export var Bird : bird
@export var Paralax: Array[Parallax2D]
@export var Paralax_pantallas: Array[Pantalla_Paralax]
@export var move_camera : int
@export var UI :Control


var distancia_siguiente_pantalla: int
var pantalla_actual : int = 0
var es_final : bool = false

var final_paralax: Parallax2D
var potencia_disparo: float = 0
var velocidad_fiesta:int = 1
var velocidad_paralax =0
var limit_superior :bool =false

enum fases  {POTENCIA, APUNTADO, VOLAR,TIENDA,GAMEOVER}
func _ready():
	distancia_siguiente_pantalla =Paralax_pantallas[0].distancia_inicio
	Global.aterrizaje.connect(_aterrizaje)
	Global.game_over.connect(game_over)
	UI.combustible.value = UI.combustible.max_value
func _process(delta):
	match fase_actual:
		fases.POTENCIA:
			elegir_potencia()
		fases.APUNTADO:
			potencia_disparo_bar.rotation_degrees = potencia_disparo_bar.rotation_degrees - velocidad_fiesta
			if potencia_disparo_bar.rotation_degrees >= 90|| potencia_disparo_bar.rotation_degrees <= 30:
				velocidad_fiesta = -velocidad_fiesta 
		fases.VOLAR:
			Bird.move_camera()
			if Bird.position.x >= distancia_siguiente_pantalla && es_final == false:
				avanzar_pantalla()
			
func _input(event): 
	match fase_actual:
		fases.POTENCIA:
			if event.is_action_released("Impulso"):
				fase_actual = fases.APUNTADO
		fases.APUNTADO:
			if event.is_action_released("Impulso"):
				Bird.impulse_bird( (Bird.position.direction_to(potencia_disparo_bar.get_child(0).global_position))*potencia_disparo*Bird.impulso_base)
				$CanvasLayer.hide()
				Global.empezar_spawnear.emit()
				fase_actual = fases.VOLAR
		fases.VOLAR:
			if event.is_action_pressed("Disparar"):
				if Bird.can_shoot:
					var nuev_bala = Bird.Arma.disparar(get_global_mouse_position(), Bird.global_position, Bird.Bala,Bird.daño_base)
					Bird.can_shoot = false
					Bird.cadencia.wait_time = Bird.Arma.cadencia
					Bird.cadencia.start()
			if event.is_action_pressed("Impulso") && UI.reduir_combustible(Bird.combustible_gasto):
				move_camera = Bird.salto
				limit_superior= false
				Bird.impulso_salto()

				

			
func elegir_potencia()->void:
	potencia_disparo_bar.value =  potencia_disparo
	potencia_disparo += 1
	if potencia_disparo >= 100:
		potencia_disparo = 0
		potencia_disparo_bar.value =0
	

func _aterrizaje():
	if fase_actual == fases.VOLAR :  
		fase_actual = fases.TIENDA
		var tween = create_tween()
		tween.tween_property(Bird.Camera, "position", Bird.posicion_final ,1)
		if es_final == true:
			get_tree().change_scene_to_file("res://pantalla_guanyar.tscn")
		else:
			
			$TiendaCanvas/Tienda.show()
		Global.destruir_spawner.emit()

func avanzar_pantalla():
	for n in Paralax.size():
		if Paralax_pantallas[pantalla_actual].paralax.size() > n:
			var coeficient_tamano= Paralax[n].get_child(0).texture.get_size()/Paralax_pantallas[0].paralax[n].get_size()
			Paralax[n].get_child(0).texture = Paralax_pantallas[pantalla_actual].paralax[n]
			Paralax[n].get_child(0).scale *=coeficient_tamano
	pantalla_actual += 1
	if Paralax_pantallas.size() > pantalla_actual:
		distancia_siguiente_pantalla = Paralax_pantallas[pantalla_actual].distancia_inicio
	else:
		es_final = true

func game_over():
	es_final =false
	_aterrizaje()

func _on_cerrar_pressed():
	get_tree().quit()
