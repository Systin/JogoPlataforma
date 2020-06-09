extends Area2D

export var proxima_cena =''

func _on_Portal_area_entered(area):
	if ('Personagem' in area.name):
# warning-ignore:return_value_discarded
		get_tree().change_scene(proxima_cena)
