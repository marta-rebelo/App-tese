extends Resource

class_name GameQuestion

@export var question_info: String
@export var type: Enum.QuestionType
@export var question_image: Texture2D
@export var question_audio: AudioStream
@export var options: Array[String]
@export var options_image: Array[Texture2D]
@export var options_audio1: AudioStream
@export var options_audio2: AudioStream
@export var correct: String
