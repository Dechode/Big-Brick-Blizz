extends Node2D

const level_1 = preload("res://levels/level_1.tscn")

var current_level: PackedScene = null

var level_count := 4

@onready var pad = $Pad
@onready var ball = $Ball


func _ready() -> void:
	current_level = level_1
	reset(current_level)


func _input(event: InputEvent) -> void:
	if OS.is_debug_build():
		if event.is_action_pressed("advance_level"):
			advance_level()


func reset(level: PackedScene):
	if not level:
		push_error("Level is null when resetting")
		return
	
	current_level = level
	
	for child in get_children():
		if child is Level:
			child.queue_free()
	
	var level_instance = level.instantiate()
	level_instance.level_finished.connect(advance_level)
	
	call_deferred("add_child", level_instance)
	ball.launched = false


func advance_level():
	var level_name := current_level.resource_path
	var prefix := "res://levels/"
	var suffix := ".tscn"
	level_name = level_name.trim_prefix(prefix)
	level_name = level_name.trim_suffix(suffix)
	
	var level_number = int(level_name.trim_prefix("level_"))
	
	if level_number >= level_count:
		print_debug("All levels done")
		reset(level_1)
		show_win_screen()
		return
	
	var level_path := "%slevel_%d%s" % [prefix , level_number + 1, suffix]
	
	var next_level = load(level_path)
	reset(next_level)


func show_win_screen():
	var win_screen = load("res://win_screen.tscn").instantiate()
	ball.launched = false
	$CanvasLayer.add_child(win_screen)


func _on_lose_area_entered(body: Node2D) -> void:
	if body is Ball:
		print("You lost the game")
		reset(current_level)

