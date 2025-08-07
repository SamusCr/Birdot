extends Area2D

@export var objetivo : RigidBody2D
@export var time_activation : float
@export var ia_enemie : IA
@export var vida_resource: Destruible
@export var explosion : AnimatedSprite2D
@export var timer_activacion: Timer

var direccion : Vector2
var time: float
var activado: bool = false
var vida_actual:int
var Camera: Camera2D

#Node enemic, depenent del Resource IA que li afegim tindra diferents modus d'atacar o moure's
#La vida es controlada pel Resource destruible, si volem que tinga vida diferent es creara un nou recurs
#Tenir en compte que es fill de Camara per a que seguexi sempre a 
#la mateixa velocitat al jugador, pero que el jugador pugui esquivar-lo
#M'he sobrecomplicat, soc idiota
func _ready():
	vida_actual = vida_resource.vida
	$Sprite2D.texture = ia_enemie.sprite
	if ia_enemie.get("weapon")!= null:
		$Timer.start()
		$Timer.wait_time = ia_enemie.weapon.cadencia
	timer_activacion.wait_time = time_activation


func _process(delta):
	time += delta
	if objetivo != null && activado == true  :
		localitzar_objectivo(objetivo)
		ia_enemie._move(direccion,position,delta)
		position += ia_enemie.direction
		if Global.player.global_position.distance_to(global_position) > 1300:
			Global.enemigo_destruido.emit(self)
			




func localitzar_objectivo(objetico_nuevo:RigidBody2D):
	objetivo= Global.player
	direccion = objetivo.position - global_position

func eliminado():
	create_explosion()
	queue_free()



func _on_timer_timeout():
	if activado == true:
		ia_enemie.atacar(direccion,global_position)


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.is_in_group("jugador"):
		body.vida.damage(ia_enemie.daño_base,body)
		Global.enemigo_destruido.emit(self)


func _on_timer_2_timeout():
	if activado == false:
		activado = true
		
func create_explosion():

	explosion.reparent(Global.player.Camera)
	explosion.position = position
	explosion.play()
	await explosion.animation_finished
	explosion.queue_free()
