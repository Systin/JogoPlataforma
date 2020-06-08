extends Area2D

var Orbe = preload('res://Cenas/Objetos/Orbe.tscn')
var tiros_disparados = 0




func _on_CooldownSkill_timeout():
	var objeto = Orbe.instance()
	get_parent().add_child(objeto)
	tiros_disparados += 1
	objeto.modulate = Color(1,1,1,1)
	objeto.name = 'Orbe_Inimigo' + name + str(tiros_disparados)
	objeto.position = position


func _on_Inimigo_area_entered(area):
	if ('Aliado' in area.name):
		queue_free()
