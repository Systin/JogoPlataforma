extends Control



func _on_Button_pressed():
	var proxima_cena = '0' + str(int(get_tree().current_scene.name) - 1) + '.tscn' 
# warning-ignore:return_value_discarded
	get_tree().change_scene('res://Cenas//Fases//'+proxima_cena)

