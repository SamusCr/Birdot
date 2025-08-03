extends Area2D

@export var objetivo : RigidBody2D
@export var time_activation : float
@export var ia_enemie : IA
@export var vida_resource: Destruible
@export var dano_autodes: int
var direccion : Vector2
var time: float
var activado: bool = false
var vida_actual:int

func _ready():
	vida_actual = vida_resource.vida
	$Sprite2D.texture = ia_enemie.sprite
	if ia_enemie.get("weapon")!= null:
		$Timer.start()
		$Timer.wait_time = ia_enemie.weapon.cadencia



func _process(delta):
	time += delta
	if objetivo != null && activado == true  :
		direccion = ( position.direction_to(objetivo.get_parent().position)-get_parent().position)
		ia_enemie._move(direccion,global_position)
		position+= (ia_enemie.direction*ia_enemie.velocidad*delta)/3


func localitzar_objectivo(objetico_nuevo:RigidBody2D):
	objetivo= Global.player
	direccion = ( position.direction_to(objetivo.get_parent().position)-get_parent().position)
	#look_at(position.direction_to(objetivo.get_parent().position))
	$Timer2.wait_time = time_activation
	$Timer2.start()

func eliminado():
	queue_free()



func _on_timer_timeout():
	if activado == true:
		ia_enemie.atacar(direccion,global_position)


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.is_in_group("jugador"):
		body.vida.damage(dano_autodes,body)
		queue_free()


func _on_timer_2_timeout():
	if activado == false:
		activado = true
