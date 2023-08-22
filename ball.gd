class_name Ball
extends CharacterBody2D

const SPEED := 600.0

var damage := 100
var launched := false

@onready var pad = get_parent().get_node("Pad")


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("launch"):
		launch()


func launch() -> void:
	if launched:
		return
		
	velocity.y = -SPEED
	velocity.x = randf_range(-0.2 * SPEED, 0.2 * SPEED)
	launched = true


func _physics_process(delta: float) -> void:
	if not launched:
		position = pad.position
		position.y = pad.position.y - 50
		return
		
	var col := move_and_collide(velocity * delta)
	if col:
		var normal := col.get_normal()
		velocity = velocity.bounce(normal)
		var rot := 0.0
		var collider := col.get_collider()
		
		if collider is PlayerPad:
			if normal.dot(Vector2.UP) == 1:
				var delta_center = abs(collider.position.x - position.x)
				var mult = delta_center / collider.size.x
				rot = lerpf(0, 70.0, mult) * sign(position.x - collider.position.x)
		
		var new_vel := velocity.rotated(deg_to_rad(rot))
		
		var dot := velocity.normalized().dot(Vector2.RIGHT)
		if abs(dot) < 0.85:
			velocity = new_vel
		
		if collider is Block:
			collider.hit(damage)
