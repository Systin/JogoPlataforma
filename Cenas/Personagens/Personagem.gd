extends Area2D

var velocidade = 0
var gravidade = 20
var esta_no_chao = true

func _physics_process(delta):
	if (!esta_no_chao):
		velocidade += gravidade 
	
	if (Input.is_action_just_pressed("ui_select")):
		velocidade = -200
		esta_no_chao = false
	position.y += velocidade * delta


func _on_Personagem_area_entered(area):
	if('Plataforma' in area.name):
		if (velocidade >= 0):
			velocidade = 0
			esta_no_chao = true



func _on_Personagem_area_exited(area):
	if('Queda' in area.name):
		esta_no_chao = false
