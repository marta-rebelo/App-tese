extends Control

@export var mainGameScene : PackedScene



func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Jogos/jogo1.tscn")


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/Jogos/jogo2.tscn")



# script func _on_jogo_3_pressed():


func _on_jogo_3_pressed():
	get_tree().change_scene_to_file("res://Scenes/Jogos/jogo3.tscn")

