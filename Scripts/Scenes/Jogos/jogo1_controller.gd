extends Node

@export var game: GameType

var buttons: Array[Button]
var index: int

var current_game: GameQuestion:
	get: return game.type[index]

@onready var question_image: TextureRect = $Control/Imagem/QuestionImage
@onready var options_audio1: AudioStreamPlayer = $"Control/AudioStreamPlayer"
@onready var options_audio2: AudioStreamPlayer = $"Control/AudioStreamPlayer2"

func _ready() -> void:
	for button in $Control/respostas.get_children():
		buttons.append(button)
	
	randomize()
#	game.type.shuffle()	
		
	load_game()

func load_game() -> void:
	
	
	question_image.texture = current_game.question_image
	
	var options = current_game.options
	options.shuffle()
	
	for i in buttons.size():
		buttons[i].text = options[i]
		buttons [i].pressed.connect(_buttons_answer.bind(buttons[i]))
	
	
	options_audio1.stream = current_game.options_audio1
	options_audio2.stream = current_game.options_audio2

func _buttons_answer(button) -> void:


	if current_game.correct == button.text:
		button.modulate = Color(0, 1.1, 0.4)
		
		_next_question()
	else:
		button.modulate = Color(2.1, 0, 0.3)
		set("theme_override_colors/font_color", Color("fcff00"))
	
#.show()
func _next_question() -> void:
	
	for bt in buttons:
		bt.pressed.disconnect(_buttons_answer)
	
	await get_tree().create_timer(1).timeout
	
	for bt in buttons:
		bt.modulate=Color.WHITE
	index +=1
	if index >= 3:
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


func _on_voltar_pressed():
	get_tree().change_scene_to_file("res://Scenes/selecionar_jogo.tscn")
