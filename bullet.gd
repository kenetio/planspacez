extends Area2D

@export var speed = 200
var damage = 1

	

func _physics_process(delta):
	position += transform.x * speed * delta
	


func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()


func _on_body_entered(body):
	if body.is_in_group('Enemy'):
		body.playded()
		queue_free()
		body.lives -= damage
	elif body.is_in_group('enemshield'):
		queue_free()
