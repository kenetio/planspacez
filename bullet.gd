extends Area2D

@export var speed = 200
var damage = 25

	

func _physics_process(delta):
	position += transform.x * speed * delta
	


func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()


func _on_body_entered(body):
	if body.is_in_group('enemy'):
		queue_free()
		if body.lives <= 25:
			$"../Main".killt+=1
		body.lives -= damage
	if body.is_in_group('planet'):
		queue_free()
