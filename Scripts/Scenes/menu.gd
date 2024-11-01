extends Control
@export var mainGameScene : PackedScene

func _ready() -> void:
	get_tree().set_quit_on_go_back(true)

func _on_jogar_pressed():
	get_tree().change_scene_to_file("res://Scenes/selecionar_jogo.tscn")
