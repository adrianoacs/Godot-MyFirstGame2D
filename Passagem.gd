extends Area2D

export(String, FILE) var cenas

func _on_Passagem_body_entered(body):
	get_tree().change_scene(cenas)
