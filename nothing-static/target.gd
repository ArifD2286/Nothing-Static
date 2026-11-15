extends CharacterBody2D

func _ready() -> void:
	add_to_group("target")

func take_damage(amount: int) -> void:
	queue_free()
