extends AudioStreamPlayer



func _on_SonsDescartaveis_finished():
	get_parent().queue_free()
