extends Node

@export var game: GameType

var buttons: Array[Button]
var index: int

var current_game: GameQuestion:
	get: return game.type[index]
	
@onready var question_audio: AudioStreamPlayer = $"Jogo 1/VBoxContainer/ImageHolder/AudioStreamPlayer"

func _ready() -> void:
	for button in $"Jogo 1/respostas".get_children():
		buttons.append(button)
		
	randomize()
	game.type.shuffle()
	load_game()
	get_tree().set_quit_on_go_back(false)
	
func load_game() -> void:
	if index == 0:	
		$"Instrucoes".play()
		$Timer.start()
	
	var options = current_game.options
	question_audio.stream = current_game.question_audio
	if index >= 1:
		question_audio.play()
	
	
	
#	options.shuffle()
	
	for i in buttons.size():
		buttons[i].text = options[i]
		buttons [i].pressed.connect(_buttons_answer.bind(buttons[i]))
		if index == 0:	
			buttons[i].disabled = true
		
func _buttons_answer(button) -> void:


	if current_game.correct == button.text:
		button.modulate = Color(0, 1.1, 0.4)
		$certo.play()
		_next_question()
	else:
		button.modulate = Color(2.1, 0, 0.3)
		$errado.play()
#
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
	$ColorRect.show()
	$"Parabéns".play()

func _on_jogar_pressed():
	get_tree().reload_current_scene()


func _on_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/selecionar_jogo.tscn")


func _on_audio_pressed():
	question_audio.play()

func _on_voltar_pressed():
	get_tree().change_scene_to_file("res://Scenes/selecionar_jogo.tscn")

func _on_timer_timeout():
	$ColorRect2.hide()
	for i in buttons.size():
		buttons[i].disabled = false
	question_audio.play()
	await get_tree().create_timer(0.5).timeout

	
func _on_skip_pressed():
	$Instrucoes.stop()
	$Timer.stop()
	_on_timer_timeout()

func _notification(what):
	if what == NOTIFICATION_WM_GO_BACK_REQUEST:
		_on_voltar_pressed()
