extends Area2D



func _on_Portal_area_entered(area):
	if ('Personagem' in area.name):
		var proxima_cena = '0' + str(int(get_tree().current_scene.name) + 1) + '.tscn' 
# warning-ignore:return_value_discarded
		get_tree().change_scene('res://Cenas//Fases//'+proxima_cena)
