@tool
class_name Block
extends StaticBody2D

signal destroyed

@export var health := 100
@export var texture := Texture2D


func _ready() -> void:
	$Sprite2D.texture = texture


func hit(damage: int):
	health -= damage
	
	if health <= 0:
		queue_free()
		destroyed.emit()


