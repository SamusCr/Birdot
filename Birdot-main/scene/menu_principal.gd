extends Control

var scena_juego : PackedScene = preload("res://scene/game.tscn")

func _ready():
	if Global.cargar_partida():
		$Menu/Continuar.show()
	$Credits/RichTextLabel.text = TranslationServer.tr("TEXTO_CREDITOS") + $Credits/RichTextLabel.text
#boto del menu principal
func _on_continuar_pressed():
	Global.actualizar_personaje.emit()
	Global.actualizar_diner.emit()
	get_tree().change_scene_to_packed(scena_juego)

func _on_empezar_pressed():
	Global.reiniciar_partida()
	get_tree().change_scene_to_packed(scena_juego)
	
func _on_opciones_pressed():
	$Menu.hide()
	$Opciones.show()


func _on_volver_pressed():
	$Opciones.hide()
	$ColorRect.hide()
	$Credits.hide()
	$Menu.show()

#Botons del menu opcions
func _on_option_button_item_selected(index):
	print($Opciones/OptionButton.get_item_text(index))
	match $Opciones/OptionButton.get_item_text(index):
		"Catala":
			TranslationServer.set_locale("ca")
		"Español":
			TranslationServer.set_locale("es")
		"Ingles":
			TranslationServer.set_locale("en")
		"Portugues":
			TranslationServer.set_locale("pt")


func _on_salir_pressed():
	get_tree().quit()


func _on_tutorial_pressed():
	$ColorRect.show()
	$Menu.hide()


func _on_credits_pressed():
	$Credits.show()
	$Opciones.hide()
