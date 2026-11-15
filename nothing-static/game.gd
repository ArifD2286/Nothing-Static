extends Node2D

@onready var player = $CharacterBody2D
@onready var label = $Label
@onready var color_rect = $ColorRect
@onready var spawnpoints: Array[Node] = $Node2D.get_children()
@export var patrick_scene: PackedScene
var time_taken: float = 0.0
var start_time: int = 0
var finished: bool = false

func _ready() -> void:
	start_time = Time.get_ticks_msec()
	label.visible = false
	color_rect.visible = false
	for i in range(5):
		var patrick = patrick_scene.instantiate()
		add_child(patrick)
		patrick.global_position = spawnpoints.pick_random().global_position


func _physics_process(delta: float) -> void:
	if finished:
		return
	if player.alive == false:
		label.visible = true
		label.text = "Game Over, u lose"
		color_rect.visible = true
	elif get_tree().get_nodes_in_group("target").size() == 0:
		finished = true
		time_taken = (Time.get_ticks_msec() - start_time) / 1000.0
		label.text = "Time" 
		
