extends Control

@export var vida : HBoxContainer
@export var combustible : TextureProgressBar

func reduir_combustible(energia : int) -> bool:
	if energia < combustible.value:
		combustible.value -= energia
		return true
	
	return false
	
func quitar_vida(vidas: int):
	for n in vidas:
		if n < vida.get_children().size():
			vida.get_children()[n-1].queue_free()
	
