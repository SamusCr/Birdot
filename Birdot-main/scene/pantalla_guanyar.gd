extends Control


func _on_cerrar_pressed():
	Global.reiniciar_partida()
	Global.guardar_partida()
	get_tree().quit()
