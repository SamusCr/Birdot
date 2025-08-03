extends Button

@export var objeto: MejoraTienda


func _ready():
	pass
	#icon.texture = objeto.sprite

#Se que es pot fer millor per actualitzar totes les millor, no tinc temps
func _on_pressed():
	if Global.dinero >= objeto.precio:
		Global.dinero -= objeto.precio
		objeto.mejora()
		Global.actualizar_personaje(get_parent().get_parent().posibles_mejoras)
