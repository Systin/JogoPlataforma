extends Control

export var cena_anterior = ''

func _on_Button_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene(cena_anterior)

