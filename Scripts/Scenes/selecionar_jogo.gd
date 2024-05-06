extends Control

@export var mainGameScene : PackedScene



func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Jogos/jogo1.tscn")
	

func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/Jogos/jogo2.tscn")



func _on_jogo_3_pressed():
	get_tree().change_scene_to_file("res://Scenes/Jogos/jogo3.tscn")



func _on_button_4_pressed():
	get_tree().change_scene_to_file("res://Scenes/Jogos/jogo4.tscn")
	

func _on_jogo_5_pressed():
	get_tree().change_scene_to_file("res://Scenes/Jogos/jogo5.tscn")

func _on_jogo_6_pressed():
	get_tree().change_scene_to_file("res://Scenes/Jogos/jogo6.tscn")


func _on_voltar_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
