class_name Level
extends Node2D

signal level_finished

var block_count := 0


func _ready() -> void:
	for child in $Blocks.get_children():
		if child is Block:
			block_count += 1
			child.destroyed.connect(_on_block_destroyed)
	print_debug(block_count)


func _on_block_destroyed() -> void:
	block_count -= 1
	print_debug("Blocks remaining %d" % block_count)
	if block_count == 0:
		level_finished.emit()
		
