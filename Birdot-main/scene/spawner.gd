extends Node2D

@export var Squadrons : Array[PackedScene]
var next_squadron : int = 0
var actual_squadron

func _ready():
	Global.squadra_destruida.connect(squadra_destru)
	Global.empezar_spawnear.connect(empezar_spawnear)
	Global.destruir_spawner.connect(destruir_spawner)
	
func spawn_squadron():
	Global.player.Camera.add_child(actual_squadron)
	actual_squadron.position = position

	var tween : Tween = create_tween()
	tween.tween_property(actual_squadron, "position", position + Vector2(200, 0),2)
	await tween.finished 
	actual_squadron.spawn()

func destruir_spawner():
	for enemie in actual_squadron.enemies:
		actual_squadron.destruir_enemigo(enemie)
	actual_squadron.queue_free()
	queue_free()

func empezar_spawnear():
	actual_squadron = Squadrons[next_squadron].instantiate()
	$Timer.start()
func squadra_destru():  
	next_squadron +=1
	if next_squadron >=Squadrons.size():
		next_squadron =0 
	actual_squadron = Squadrons[next_squadron].instantiate()
	spawn_squadron()
	$Timer.wait_time = actual_squadron .time_spawn
	$Timer.start
	

func _on_timer_timeout():
	spawn_squadron()
