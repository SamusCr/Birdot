extends VBoxContainer

@export var objeto: MejoraTienda
@export var precio_label: Label
@export var num_mejora_label: Label
@export var boton : Button

func _ready():
	precio_label.text = str(objeto.precio)
	num_mejora_label.text = str(objeto.numero_mejoras)
	boton.text = objeto.nombre
	#icon.texture = objeto.sprite

#Se que es pot fer millor per actualitzar totes les millor, no tinc temps


func actualizar_objeto_tienda():
	pass


func _on_casilla_tienda_pressed():
	if Global.dinero >= objeto.precio:
		Global.dinero -= objeto.precio
		objeto.mejora(1)
		precio_label.text = str(objeto.precio)
		num_mejora_label.text = str(objeto.numero_mejoras)
