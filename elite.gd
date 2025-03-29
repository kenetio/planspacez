extends CharacterBody2D

@export var bullet : PackedScene
var active = false
var walk = false
var new_transform = Vector2()
var speed = 400
var lives = 150
var waswisibl = false


func _on_area_2d_body_entered(body):
	if body.is_in_group('player'):
		active = true
		walk = true

func _physics_process(delta):
	if active:
		new_transform = transform.looking_at($"../Main/Player".position)
		transform  = transform.interpolate_with(new_transform, 10 * delta)
		if walk:
			position = position.move_toward($"../Main/Player".position, speed * delta)
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
		var b1 = bullet.instantiate()
		get_tree().root.add_child(b1)
		b1.transform = $Marker2D2.global_transform
		var b2 = bullet.instantiate()
		get_tree().root.add_child(b2)
		b2.transform = $Marker2D3.global_transform
		var b3 = bullet.instantiate()
		get_tree().root.add_child(b3)
		b3.transform = $Marker2D4.global_transform
		var b4 = bullet.instantiate()
		get_tree().root.add_child(b4)
		b4.transform = $Marker2D5.global_transform


func _on_timer_timeout():
	shoot()


func _on_visible_on_screen_enabler_2d_screen_entered():
	waswisibl = true


func _on_timer_2_timeout():
	if waswisibl == false:
		queue_free()
