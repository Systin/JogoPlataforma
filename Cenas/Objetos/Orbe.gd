extends Area2D

export var direcao = Vector2(-1,0)
export var velocidade = 300

func _physics_process(delta):
	position += direcao * velocidade * delta


func _on_Orbe_area_entered(area):
	if ('Orbe' in area.name):
		if ('Aliado' in name):
			area.queue_free()


func _on_TTL_timeout():
	queue_free()
