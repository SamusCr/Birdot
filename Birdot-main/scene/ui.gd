extends Control

@export var vida : HBoxContainer
@export var combustible : TextureProgressBar


func _ready():
	Global.actualizar_diner.connect(actualozar_UI)
	combustible.value = combustible.max_value
	
	
func reduir_combustible(energia : int) -> bool:
	if energia <= combustible.value:
		combustible.value -= energia
		return true
	return false

func actualozar_UI():
	combustible.max_value = Global.player.combustible_max
	$Label.text = str(Global.mejoras["DINERO"] )+ "  G"

func quitar_vida(vidas: int):
	for n in vidas:
		if n < vida.get_children().size():
			vida.get_children()[n-1].queue_free()
	
