extends Node2D

export var velocidade = 150


func _physics_process(delta):
	position.x -= velocidade * delta

