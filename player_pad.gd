class_name PlayerPad
extends CharacterBody2D

const SPEED = 800.0

var size := Vector2(150, 30)
var key_input := 0.0


func _ready() -> void:
	$CollisionShape2D.shape.height = size.x
	$CollisionShape2D.shape.radius = size.y * 0.5



func _physics_process(delta: float) -> void:
	key_input = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	velocity.x = SPEED * key_input
	move_and_collide(velocity * delta)
