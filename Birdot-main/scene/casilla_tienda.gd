class_name Casilla_tienda
extends VBoxContainer

@export var objeto: MejoraTienda
@export var precio_label: Label
@export var num_mejora_label: Label
@export var boton : Button



func actualizar_boton():
	objeto.actualziar_mejora()
	precio_label.text = str(objeto.precio) + " G"
	num_mejora_label.text = str(objeto.numero_mejoras)
	boton.text = tr(objeto.nombre)
	
func _on_casilla_tienda_pressed():
	if Global.mejoras["DINERO"] >= objeto.precio:
		objeto.mejora(1)
		precio_label.text = str(objeto.precio)+ " G"
		num_mejora_label.text = str(objeto.numero_mejoras)
		Global.actualizar_diner.emit()
		Global.mejoras["DINERO"] -= objeto.precio
