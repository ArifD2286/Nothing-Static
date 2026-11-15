extends CharacterBody2D

var speed: float = 500.0
var damage: int = 10
var direction: Vector2 = Vector2.RIGHT

func _ready() -> void:
	rotation = direction.angle()
	await get_tree().create_timer(30.0).timeout
	queue_free()

func _physics_process(delta: float) -> void:
	var collision := move_and_collide(direction * speed * delta)
	if collision: 
		var collider = collision.get_collider()
		if collider.is_in_group("target") or collider.is_in_group("player"):
			collider.take_damage(damage)
			queue_free()
		else:
			direction = direction.bounce(collision.get_normal())
			rotation = direction.angle()
