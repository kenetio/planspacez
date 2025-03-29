extends CharacterBody2D

@export var bullet : PackedScene
var active = false
var walk = false
var new_transform = Vector2()
var speed = 300
var lives = 50


func _on_area_2d_body_entered(body):
	if body.is_in_group('player'):
		active = true
		walk = true

func _physics_process(delta):
	if active:
		new_transform = transform.looking_at($"../Player".position)
		transform  = transform.interpolate_with(new_transform, 10 * delta)
		if walk:
			position = position.move_toward($"../Player".position, speed * delta)
	if lives <= 0:
		queue_free()
	if lives < 50:
		active = true
	
	
	move_and_slide()


func _on_area_2d_2_body_entered(body):
	if body.is_in_group('player'):
		walk = false


func _on_area_2d_2_body_exited(body):
	if body.is_in_group('player'):
		walk = true
		

func shoot():
	if active:
		var b = bullet.instantiate()
		get_tree().root.add_child(b)
		b.transform = $Marker2D.global_transform

func _on_timer_timeout():
	shoot()
