extends CharacterBody2D


@export var bullet_scene: PackedScene
@export var speed: float = 250
@onready var game = get_parent()
var alive = true


func _ready() -> void:
	add_to_group("player")


func _physics_process(delta: float) -> void:
	if alive == true:
		var direction := Input.get_vector("left", "right", "up", "down")
		velocity = direction * speed
		look_at(get_global_mouse_position())
	move_and_slide()
	if Input.is_action_just_pressed("shoot") and alive == true:
		shoot()

func shoot() -> void:
	var bullet = bullet_scene.instantiate()
	var angle = rotation
	bullet.direction = Vector2.RIGHT.rotated(angle)
	get_tree().current_scene.add_child(bullet)
	bullet.global_position = $Muzzle.global_position

func take_damage(amount: int) -> void:
	alive = false
