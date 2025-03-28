extends Area2D

@export var speed = 500
var damage = 42

	

func _physics_process(delta):
	position += transform.x * speed * delta
	


func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()


func _on_body_entered(body):
	if body.is_in_group('player'):
		queue_free()
		body.lives -= damage
	if body.is_in_group('planet'):
		queue_free()
