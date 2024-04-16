extends Node

@export var game: GameType


var buttons: Array[Button]
var index: int

var current_game: GameQuestion:
	get: return game.type[index]

@onready var texto_das_perguntas = $"Control/perguntas/texto das perguntas"
@onready var options_audio1: AudioStreamPlayer = $"Control/AudioStreamPlayer"
@onready var options_audio2: AudioStreamPlayer = $"Control/AudioStreamPlayer2"

func _ready() -> void:
	for button in $Control/respostas.get_children():
		buttons.append(button)
	
	randomize()
	game.type.shuffle()	
	load_game()

func load_game() -> void:

	texto_das_perguntas.text = current_game.question_info
	var options = current_game.options
	var gameoptions_image = current_game.options_image
	
	options_audio1.stream = current_game.options_audio1
	options_audio2.stream = current_game.options_audio2


#	options.shuffle()

	for i in buttons.size():
		buttons[i].text = options[i]
		buttons[i].get_child(0).texture = gameoptions_image[i]
		buttons [i].pressed.connect(_buttons_answer.bind(buttons[i]))
	

func _buttons_answer(button) -> void:
	if current_game.correct == button.text:
		button.modulate = Color(0, 1.1, 0.4)
		_next_question()
		
	else:
		button.modulate = Color(2.1, 0, 0.3)
		

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
	$Control/ColorRect.show()


func _on_jogar_pressed():
	get_tree().reload_current_scene()

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/selecionar_jogo.tscn")



func _on_audio_2_pressed():
	options_audio2.play()


func _on_audio_1_pressed():
	options_audio1.play()

