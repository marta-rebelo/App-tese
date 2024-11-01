extends Resource

class_name GameQuestion

@export_category("Texto")
@export var question_info: String
@export var options: Array[String]
@export var correct: String


@export_category("Imagem")
@export var question_image: Texture2D
@export var options_image: Array[Texture2D]


@export_category("Audio")
@export var question_audio: AudioStream

@export_group("Botões de áudio")
@export var options_audio1: AudioStream
@export var options_audio2: AudioStream

#@export var options_audio3: AudioStream
#@export var options_audio4: AudioStream


