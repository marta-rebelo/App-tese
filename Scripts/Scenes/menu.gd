extends Control
@export var mainGameScene : PackedScene


func _on_jogar_pressed():
	get_tree().change_scene_to_file("res://Scenes/selecionar_jogo.tscn")
