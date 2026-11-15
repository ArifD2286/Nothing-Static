extends CharacterBody2D

@onready var spawn_point
@export var bullet_scene = PackedScene
@export var speed: float = 100


func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	look_at(get_global_mouse_position())
	move_and_slide()


func shoot() -> void:
	var bullet = bullet_scene.instantiate()
	bullet.direction = Vector2.RIGHT.rotated(angle)
	bullet.speed = gun.bullet_speed
	bullet.damage = gun.damage
	get_tree().current_scene.add_child(bullet)
	bullet.global_position = $Muzzle.global_position
