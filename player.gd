extends CharacterBody2D

#@export var bullet : PackedScene
@export var nspeed = 300
@export var bullet : PackedScene
var speed = 500
var speedr = 10
var target_pos = Vector2()
var new_transform = Vector2()
var canshoot = true
func _physics_process(delta):
	target_pos = get_global_mouse_position()
	new_transform = transform.looking_at(target_pos)
	transform  = transform.interpolate_with(new_transform, speedr * delta)
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
	if Input.is_mouse_button_pressed(1) and canshoot:
		shoot()
	
	
	move_and_slide()
	
func shoot():
	var b = bullet.instantiate()
	get_tree().root.add_child(b)
	b.transform = $Marker2D.global_transform
	$Timer.start()
	canshoot = false
	
		
func enterplanet():
	$"..".enterplanet()

func _on_timer_timeout():
	canshoot = true
