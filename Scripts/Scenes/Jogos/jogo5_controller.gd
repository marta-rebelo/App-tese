extends Node

@export var game: GameType
@export var color_right: Color
@export var color_wrong: Color

var buttons: Array[Button]
var index: int

var current_game: GameQuestion:
	get: return game.type[index]
	
@onready var question_audio: AudioStreamPlayer = $"Jogo 5/VBoxContainer/ImageHolder/AudioStreamPlayer"

func _ready() -> void:
	for button in $"Jogo 5/VBoxContainer/respostas".get_children():
		buttons.append(button)
		
	randomize()
	game.type.shuffle()
	load_game()
	
func load_game() -> void:
	
	
	question_audio.stream = current_game.question_audio
	question_audio.play()
	
	var options = current_game.options
	
#	options.shuffle()
	
	for i in buttons.size():
		buttons[i].text = options[i]
		buttons [i].pressed.connect(_buttons_answer.bind(buttons[i]))
		
func _buttons_answer(button) -> void:


	if current_game.correct == button.text:
		button.modulate = color_right
		_next_question()
	else:
		button.modulate = color_wrong
#
func _next_question() -> void:
	
	for bt in buttons:
		bt.pressed.disconnect(_buttons_answer)

	await get_tree().create_timer(1).timeout

	for bt in buttons:
		bt.modulate=Color.WHITE
	index +=1
	if index >= 2:
		_game_over()
	else:
		load_game()

func _game_over() -> void:
	$"Jogo 5/ColorRect".show()


func _on_jogar_pressed():
	get_tree().reload_current_scene()


func _on_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/selecionar_jogo.tscn")


func _on_audio_pressed():
	question_audio.play()
