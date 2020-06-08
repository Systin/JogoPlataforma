extends Node2D
export var v = true
export var sobe = true
export var direita = true
var oneshot = true
func _on_Area2D_area_entered(area):
	if ('Personagem' in area.name):
		if (oneshot):
			oneshot = false
			if (v):
				if (!sobe):
					position.y += 64
				else:
					position.y -= 64
			else: 
				if (direita):
					position.x += 64
				else:
					position.x -= 64
