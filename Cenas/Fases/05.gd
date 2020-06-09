extends Control

var cena = "res://Cenas/Fases/00.tscn"

func _on_Button_button_down():
# warning-ignore:return_value_discarded
	get_tree().change_scene(cena)
