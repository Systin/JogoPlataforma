extends Area2D

var velocidade = 0
var gravidade = 20
var esta_no_chao = false
var defendendo = false
var defesa = 100
var barra_q
export var cena_atual = ''
 
func _ready():
	barra_q = get_parent().get_node("HUD/VBoxContainer/HBoxContainer/BarraQ")

func _physics_process(delta):
	if (Input.is_action_just_pressed("q") and defesa > 10):
		defendendo = true
	if (Input.is_action_just_released("q")):
		defendendo = false
	
	$Protecao.visible = defendendo
	
	if (defendendo):
		defesa -= 50 * delta
		
	if (is_instance_valid(barra_q)):
		barra_q.value = defesa
	
	if (!esta_no_chao):
		velocidade += gravidade 
	if (Input.is_action_just_pressed("ui_select") and esta_no_chao):
		velocidade = -500
		esta_no_chao = false
	position.y += velocidade * delta


func _on_Personagem_area_entered(area):
	if ('MataPlayer' in area.name):
		morte()

	if ('Orbe_Inimigo' in area.name):
		if (defendendo):
			area.name = 'Orbe_Aliado'
			area.set('direcao',Vector2(1,0))
			area.modulate = Color(0,0,0,1)
		else:
			morte()
	elif ('Inimigo' in area.name):
		morte()
	

	if ('Mana' in area.name):
		area.queue_free()
		defesa += 50
		if (defesa > 100):
			defesa = 100

func _on_Pes_area_entered(area):
	if('Plataforma' in area.name):
		if (velocidade >= 0):
			position = (position / 64).round() * 64
			position.y -= 30
			velocidade = 0
			esta_no_chao = true


func _on_Pes_area_exited(area):
	if('Queda' in area.name):
		esta_no_chao = false

func morte():
# warning-ignore:return_value_discarded
	get_tree().change_scene(cena_atual)
