extends CharacterBody2D

@onready var fart_sfx = $Fart_sfx

func _ready() -> void:
	add_to_group("target")

func take_damage(amount: int) -> void:
	fart_sfx.play()
	queue_free()
