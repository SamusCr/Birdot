class_name Bullet

extends Area2D

@export var vida_resource: Destruible
@export var Color_Bala: Color
var velocidad: float
var direccion: Vector2
var daño: int
var vida_actual : int


func _physics_process(delta):
	position +=  direccion.normalized()*delta*velocidad
	


func _on_timer_timeout():
	queue_free()



func _on_area_entered(area):
	if  area.is_in_group("bala_enemigo")|| area.is_in_group("enemigo")|| area.is_in_group("jugador"):
		area.vida_resource.damage(daño,area)
		queue_free()


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if  body.is_in_group("jugador"):
		body.vida.damage(daño,body)
		queue_free()
